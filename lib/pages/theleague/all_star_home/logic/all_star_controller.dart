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
  void set isLoading(bool loading) => state.isLoading.value = loading;
  void set selectedTeamCode(String code) => state.selectedTeamCode.value = code;
  void set title(String title) => state.title = title;
  void set totalQty(int qty) => state.totalQty.value = qty;

  void calculateTotalQty() {
    state.totalQty.value = 0;
    if (state.selectedPlayers.isNotEmpty)
      state.selectedPlayers.values.forEach((element) {
        state.totalQty.value += element.length;
      });
  }

  String getPositionName({required String position}) {
    switch (position) {
      case 'MB':
        {
          return 'Төвийн хаагч';
        }
      case 'S':
        {
          return 'Холбогч';
        }
      case 'L':
        {
          return 'Хамгаалагч';
        }
      case 'OH':
        {
          return 'Холбогчийн эсрэг';
        }
      case 'OPH':
        {
          return 'Хүчний довтлогч';
        }
      case 'CO':
        {
          return 'Дасгалжуулагч';
        }

      default:
        return '';
    }
  }

  int getPositionMaxPlayer(String position) {
    switch (position) {
      case 'MB':
        {
          return 4;
        }
      case 'S':
        {
          return 2;
        }
      case 'L':
        {
          return 2;
        }
      case 'OH':
        {
          return 4;
        }
      case 'OPH':
        {
          return 2;
        }
      case 'CO':
        {
          return 2;
        }

      default:
        return 0;
    }
  }

  RxInt getTeamPlayersQty({required String teamCode}) {
    RxInt qty = RxInt(0);
    state.selectedPlayers['${state.title}']?.forEach((player) {
      if (player['teamCode'].toLowerCase() == teamCode.toLowerCase()) qty += 1;
    });

    return qty;
  }

  String getTitle() {
    switch (state.title) {
      case 'MB':
        {
          return 'Төвийн хаагч';
        }
      case 'S':
        {
          return 'Холбогч';
        }
      case 'L':
        {
          return 'Хамгаалагч';
        }
      case 'OH':
        {
          return 'Холбогчийн эсрэг';
        }
      case 'OPH':
        {
          return 'Хүчний довтлогч';
        }
      case 'CO':
        {
          return 'Дасгалжуулагч';
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
    gender = Get.parameters['gender'] ?? '';
    state.category.value = Get.parameters['category'] ?? '';
    state.gameCode.value = Get.parameters['gameCode'] ?? '';

    await checkVote();
    state.teams.clear();
    List<dynamic> allTeam = await MyStorage().getData(Constants.TEAMS);
    allTeam.forEach((element) {
      if (element['gender'] == state.gender.value) state.teams.add(element);
    });

    if (Get.arguments != null) {
      state.selectedPlayers.value = Get.arguments ?? {};
    }

    if (await MyStorage().getData(state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale) != null) {
      Map<String, dynamic> selected = await MyStorage().getData(state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale);

      state.selectedPlayers.value = {
        'MB': RxList<Map<String, dynamic>>([]),
        'L': RxList<Map<String, dynamic>>([]),
        'S': RxList<Map<String, dynamic>>([]),
        'OH': RxList<Map<String, dynamic>>([]),
        'OPH': RxList<Map<String, dynamic>>([]),
        'CO': RxList<Map<String, dynamic>>([]),
      };

      state.selectedPlayers['MB'] = RxList.from(selected['MB']);
      state.selectedPlayers['L'] = RxList.from(selected['L']);
      state.selectedPlayers['S'] = RxList.from(selected['S']);
      state.selectedPlayers['OH'] = RxList.from(selected['OH']);
      state.selectedPlayers['OPH'] = RxList.from(selected['OPH']);
      state.selectedPlayers['CO'] = RxList.from(selected['CO'] ?? []);
    }

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
    Map<String, dynamic> team = state.teams.firstWhereOrNull(
          (element) => element['code'].toLowerCase() == state.selectedTeamCode.value.toLowerCase(),
        ) ??
        {};

    for (var player in team['players']) {
      for (var position in player['positionCodes']) {
        if (position.toLowerCase() == state.title.toLowerCase()) {
          dynamic exist = state.teamPlayers.firstWhereOrNull((element) => element['_id'] == player['_id']);
          if (exist == null) state.teamPlayers.add(player);
        }
      }
    }

    state.teamPlayers.refresh();
  }

  Future<void> voteOnline() async {
    prepareList();
    var body = {
      'gameCode': state.gameCode.value,
      'category': state.category.value,
      'gender': state.gender.value,
      'vote': state.preparedList,
    };

    isLoading = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/vote/vote-online', method: Method.post, body: body);
    isLoading = false;
    if (isSuccess) {
      Get.until((route) => Get.currentRoute == '${MyRoutes.voteResult}/${state.category.value}/${state.gameCode.value}/${state.gender.value}');
      AlertHelper.showFlashAlert(title: 'Амжилттай', message: '${response['result']['message']}');
      _clearData();
      await _voteController.refreshFunction();
    } else {
      var message = response['error']['message'] as String;
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  Future<void> checkVote() async {
    isLoading = true;
    Map<String, dynamic> meta = await MyStorage().getData(Constants.META_DATA);
    List<dynamic> players = meta['players'];
    var body = {'gameCode': state.gameCode.value, 'gender': state.gender.value};
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: 'api/vote/check-vote',
      method: Method.post,
      body: body,
    );
    isLoading = false;
    if (isSuccess) {
      if (response['remaining_seconds'] != null && response['remaining_seconds'] > 0) {
        state.isCanVote.value = false;
        AlertHelper.showFlashAlert(
          title: 'Уучлаарай',
          message: 'Та ${formatDuration(response['remaining_seconds'])} дараа дахин санал өгөх боломжтой.',
          status: FlashStatus.failed,
        );

        state.selectedPlayers.value = {
          'MB': RxList<Map<String, dynamic>>([]),
          'L': RxList<Map<String, dynamic>>([]),
          'S': RxList<Map<String, dynamic>>([]),
          'OH': RxList<Map<String, dynamic>>([]),
          'OPH': RxList<Map<String, dynamic>>([]),
          'CO': RxList<Map<String, dynamic>>([]),
        };

        List<dynamic> midBlocker = response['voteData']['MB'] ?? [];
        List<dynamic> libero = response['voteData']['L'] ?? [];
        List<dynamic> setter = response['voteData']['S'] ?? [];
        List<dynamic> outSideHitter = response['voteData']['OH'] ?? [];
        List<dynamic> outSidePowerHitter = response['voteData']['OPH'] ?? [];
        List<dynamic> coach = response['voteData']['CO'] ?? [];

        /// MB
        if (midBlocker.isNotEmpty)
          for (var pgIndex = 0; pgIndex < midBlocker.length; pgIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == midBlocker[pgIndex]) {
                state.selectedPlayers['MB']?.add(players[playerIndex]);
              }
            }
          }

        /// Libero
        if (libero.isNotEmpty)
          for (var fIndex = 0; fIndex < libero.length; fIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == libero[fIndex]) {
                state.selectedPlayers['L']?.add(players[playerIndex]);
              }
            }
          }

        /// Setter
        if (setter.isNotEmpty)
          for (var gIndex = 0; gIndex < setter.length; gIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == setter[gIndex]) {
                state.selectedPlayers['S']?.add(players[playerIndex]);
              }
            }
          }

        /// OPH
        if (outSidePowerHitter.isNotEmpty)
          for (var gIndex = 0; gIndex < outSidePowerHitter.length; gIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == outSidePowerHitter[gIndex]) {
                state.selectedPlayers['OPH']?.add(players[playerIndex]);
              }
            }
          }

        /// OH
        if (outSideHitter.isNotEmpty)
          for (var cIndex = 0; cIndex < outSideHitter.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == outSideHitter[cIndex]) {
                state.selectedPlayers['OH']?.add(players[playerIndex]);
              }
            }
          }

        /// Coach
        if (coach.isNotEmpty)
          for (var cIndex = 0; cIndex < coach.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == coach[cIndex]) {
                state.selectedPlayers['CO']?.add(players[playerIndex]);
              }
            }
          }
      } else {
        state.isCanVote.value = true;
      }
    } else {
      var message = response['error']['message'] as String;
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  String formatDuration(int seconds) {
    if (seconds >= 3600) {
      int hours = seconds ~/ 3600;
      return '$hours цагын';
    } else if (seconds >= 60) {
      int minutes = seconds ~/ 60;
      return '$minutes минутын';
    } else {
      return '$seconds секундын';
    }
  }

  void _clearData() {
    MyStorage().saveData(Constants.PlayersMale, null);
    MyStorage().saveData(Constants.PlayersFemale, null);
    MyStorage().saveData(Constants.TicketCode, null);
  }
}
