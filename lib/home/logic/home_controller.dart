import 'package:get/get.dart';
import 'package:mezorn_api_caller/api_caller.dart';
import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../state/home_state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  void set gender(String gender) => state.gender.value = gender;
  void set selectedTeamCode(String code) => state.selectedTeamCode.value = code;
  void set title(String title) => state.title = title;
  void set totalQty(int qty) => state.totalQty.value = qty;

  void calculateTotalQty() {
    state.totalQty.value = 0;
    state.selectedPlayers.values.forEach((element) {
      state.totalQty.value += element.length;
    });
  }

  String getPositionName({required String position}) {
    switch (position) {
      case 'G':
        {
          return 'Хамгаалагч';
        }
      case 'F':
        {
          return 'Довтлогч';
        }
      case 'C':
        {
          return 'Төв';
        }
      case 'PF':
        {
          return 'Хүчний довтлогч';
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

  @override
  void onInit() {
    gender = Get.parameters['gender']!;
    state.selectedPlayers.value = LocalStorage.getData(state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale) ??
        RxMap({
          'F': RxList(),
          'G': RxList(),
          'PG': RxList(),
          'C': RxList(),
        });

    super.onInit();
  }

  void setPlayersPosition() {
    state.teamPlayers.clear();
    Map<String, dynamic> team = state.teams.firstWhereOrNull((element) => element['code'] == state.selectedTeamCode.value) ?? {};

    for (var player in team['players']) {
      for (var position in player['positionCodes']) {
        if (position == state.title) {
          state.teamPlayers.add(player);
          if (state.title == 'F' && position == 'PF') {
            state.teamPlayers.add(player);
          }
        }
      }
    }
    state.teamPlayers.refresh();
  }

  Future<void> voteArena() async {
    var body = {
      'gender': state.gender.value,
      'game_code': '',
      'lat': '',
      'lon': '',
      'vote': state.selectedPlayers,
    };
    dynamic response = await ApiClient.sendRequest(
      '/api/me/vote-arena',
      method: Method.post,
      body: body,
    );
    if (MezornClientHelper.isValidResponse(response)) {
      var _responseJson = response.data['data']['result'];
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
    var body = {
      'gender': state.gender.value,
      'vote': state.selectedPlayers,
    };
    dynamic response = await ApiClient.sendRequest(
      '/api/me/vote-online',
      method: Method.post,
      body: body,
    );
    if (MezornClientHelper.isValidResponse(response)) {
      var _responseJson = response.data['data']['result'];
    } else {
      var message = response.data['error']['message'] as String;

      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }
}
