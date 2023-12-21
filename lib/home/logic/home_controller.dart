import 'package:get/get.dart';
import '../state/home_state.dart';

class HomeController extends GetxController {
  final state = HomeState();

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

  void setPlayersPosition() {
    state.teamPlayers.clear();

    Map<String, dynamic> team = state.teams.firstWhereOrNull((element) => element['code'] == state.selectedTeamCode.value);
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
}
