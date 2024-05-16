import 'package:get/get.dart';

import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../route/my_routes.dart';
import '../../../../service/method.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../../vote_result/logic/vote_result_controller.dart';
import '../state/all_star_state.dart';

class AllStarController extends GetxController {
  final VoteResultController _voteController = Get.find();
  final state = AllStarState();

  void set gender(String gender) => state.gender.value = gender;
  void set isCanVote(bool vote) => state.isCanVote.value = vote;
  void set isLoading(bool loading) => state.isLoading.value = loading;
  void set selectedTeamCode(String code) => state.selectedTeamCode.value = code;
  void set title(String title) => state.title = title;
  void set totalQty(int qty) => state.totalQty.value = qty;
  void set type(String type) => state.type.value = type;

  void calculateTotalQty() {
    state.totalQty.value = 0;
    state.selectedPlayers.values.forEach((element) {
      state.totalQty.value += element.length;
    });
  }

  String getPosition({required String positionName}) {
    switch (positionName) {
      case 'G':
        {
          return 'G';
        }
      case 'PG':
        {
          return 'PG';
        }
      case 'SG':
        {
          return 'G';
        }
      case 'F':
        {
          return 'F';
        }
      case 'SF':
        {
          return 'F';
        }
      case 'PF':
        {
          return 'F';
        }
      case 'C':
        {
          return 'C';
        }

      default:
        return '';
    }
  }

  String getPositionName({required String position}) {
    switch (position) {
      case 'G':
        {
          return 'Хамгаалагч';
        }
      case 'SG':
        {
          return 'Хамгаалагч';
        }
      case 'F':
        {
          return 'Довтлогч';
        }
      case 'SF':
        {
          return 'Довтлогч';
        }
      case 'C':
        {
          return 'Төв';
        }
      case 'PF':
        {
          return 'Довтлогч';
        }
      case 'PG':
        {
          return 'Холбогч';
        }
      default:
        return '';
    }
  }

  RxInt getTeamPlayersQty({required String teamCode}) {
    RxInt qty = RxInt(0);
    state.selectedPlayers['${state.title}']?.forEach((player) {
      if (player['teamCode'] == teamCode) qty += 1;
    });

    return qty;
  }

  String getTitle() {
    switch (state.title) {
      case 'G':
        {
          return 'Хамгаалагч сонгох';
        }
      case 'F':
        {
          return 'Довтлогч сонгох';
        }
      case 'C':
        {
          return 'Төвийн тоглогч сонгох';
        }
      case 'PG':
        {
          return 'Холбогч сонгох';
        }
      default:
        return '';
    }
  }

  RxBool isSelected({required String playerId}) {
    Map<String, dynamic>? _existPlayer = state.selectedPlayers['${state.title}']?.firstWhereOrNull((element) => element['_id'] == playerId);

    return _existPlayer == null ? RxBool(false) : RxBool(true);
  }

  @override
  void onInit() async {
    state.coachData.value = await MyStorage.instance.getData('coachData');
    gender = Get.parameters['gender']!;
    isCanVote = bool.parse(Get.parameters['isCanVote']!);
    type = Get.parameters['type']!;

    if (await MyStorage().getData(state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale) != null) {
      state.selectedPlayers.value =
          Get.arguments != null ? Get.arguments : MyStorage().getData(state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale);
    }

    state.teams.clear();
    List<dynamic> allTeam = await MyStorage().getData(Constants.TEAMS);
    allTeam.forEach((element) {
      if (element['gender'] == state.gender.value) state.teams.add(element);
    });
    calculateTotalQty();

    super.onInit();
  }

  void prepareList() {
    state.preparedList.clear();
    state.selectedPlayers.forEach((key, value) {
      List<String> list = [];
      for (Map<String, dynamic> player in value) {
        list.add(player['_id']);
        state.preparedList[key] = list;
      }
    });
  }

  void setPlayersPosition() {
    state.teamPlayers.clear();
    Map<String, dynamic> team = state.teams.firstWhereOrNull((element) => element['code'] == state.selectedTeamCode.value) ?? {};
    for (var player in team['players']) {
      for (var position in player['positionCodes']) {
        if (getPosition(positionName: position) == state.title) {
          dynamic exist = state.teamPlayers.firstWhereOrNull((element) => element['_id'] == player['_id']);
          if (exist == null) state.teamPlayers.add(player);
        }
      }
    }
    state.teamPlayers.refresh();
  }

  Future<void> voteArena() async {
    prepareList();
    var body = {
      'gender': state.gender.value,
      'game_code': await MyStorage().getData(Constants.TicketCode),
      'lat': await MyStorage().getData('lat'),
      'lon': await MyStorage().getData('lon'),
      'vote': state.preparedList,
    };
    isLoading = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me/vote-arena', method: Method.post, body: body);
    isLoading = false;
    if (isSuccess) {
      if (response.data['statusCode'] == 400) {
        var message = response.data['message_mn'] ?? response.data['message'] as String;
        MyStorage().saveData(Constants.TicketCode, null);
        Get.offNamed(MyRoutes.onboarding);

        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: message,
          status: FlashStatus.failed,
        );
      } else {
        await _voteController.refreshFunction();
        AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Таны саналыг хүлээж авлаа. Та 24 цагийн дараа дахин санал өгөх боломжтой.');
        Get.until((route) => Get.currentRoute == MyRoutes.voteResult);

        _clearData();
      }
    } else {
      var message = response.data['error']['message'] as String;

      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  Future<void> voteCoach() async {
    prepareList();
    var body = {
      'gender': state.gender.value,
      'vote': state.preparedList,
    };
    isLoading = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me/vote-coach', method: Method.post, body: body);
    isLoading = false;
    if (isSuccess) {
      if (response.data['statusCode'] == 400 || response.data['statusCode'] == 404) {
        var message = response.data['message_mn'] ?? response.data['error']['message'] as String;

        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: message,
          status: FlashStatus.failed,
        );
      } else {
        await _voteController.refreshFunction();
        AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Таны саналыг хүлээж авлаа.');
        Get.until((route) => Get.currentRoute == MyRoutes.voteResult);
        _clearData();
      }
    } else {
      var message = response.data['error']['message'] as String;

      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  Future<void> voteOnline() async {
    prepareList();
    var body = {
      'gender': state.gender.value,
      'vote': state.preparedList,
    };
    isLoading = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me/vote-online', method: Method.post, body: body);
    isLoading = false;
    if (isSuccess) {
      if (response.data['statusCode'] == 400) {
        var message = response.data['message_mn'] ?? response.data['error']['message'] as String;

        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: message,
          status: FlashStatus.failed,
        );
      } else {
        await _voteController.refreshFunction();
        AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Таны саналыг хүлээж авлаа. Та 24 цагийн дараа дахин санал өгөх боломжтой.');
        Get.until((route) => Get.currentRoute == MyRoutes.voteResult);
        _clearData();
      }
    } else {
      var message = response.data['error']['message'] as String;

      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  void _clearData() {
    MyStorage().saveData(Constants.PlayersMale, null);
    MyStorage().saveData(Constants.PlayersFemale, null);
    MyStorage().saveData(Constants.TicketCode, null);
  }
}
