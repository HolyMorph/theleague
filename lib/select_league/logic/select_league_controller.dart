import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';

import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../state/select_league_state.dart';

class SelectLeagueController extends GetxController {
  final state = SelectLeagueState();

  void set gender(String gender) => state.gender.value = gender;
  void set isCanVote(bool vote) => state.isCanVote.value = vote;
  void set isLoading(bool loading) => state.isLoading.value = loading;

  Future<void> checkVote() async {
    isLoading = true;
    List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];
    dynamic response = await ApiClient().sendRequest(
      '/api/me/check-vote',
      method: Method.post,
      body: {'gender': state.gender.value},
    );
    isLoading = false;

    if (MezornClientHelper.isValidResponse(response)) {
      if (response.data['remaining_seconds'] == null) {
        isCanVote = true;
      } else {
        isCanVote = false;

        state.result = {
          "PG": RxList<Map<String, dynamic>>([]),
          "F": RxList<Map<String, dynamic>>([]),
          "G": RxList<Map<String, dynamic>>([]),
          "C": RxList<Map<String, dynamic>>([]),
        };

        List<dynamic> pointguard = response.data['voteData']['PG'] ?? [];
        List<dynamic> forward = response.data['voteData']['F'] ?? [];
        List<dynamic> guard = response.data['voteData']['G'] ?? [];
        List<dynamic> center = response.data['voteData']['C'] ?? [];

        /// point guard
        if (pointguard.isNotEmpty)
          for (var pgIndex = 0; pgIndex < pointguard.length; pgIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == pointguard[pgIndex]) {
                state.result['PG'].add(players[playerIndex]);
              }
            }
          }

        /// forward
        if (forward.isNotEmpty)
          for (var fIndex = 0; fIndex < forward.length; fIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == forward[fIndex]) {
                state.result['F'].add(players[playerIndex]);
              }
            }
          }

        /// guard
        if (guard.isNotEmpty)
          for (var gIndex = 0; gIndex < guard.length; gIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == guard[gIndex]) {
                state.result['G'].add(players[playerIndex]);
              }
            }
          }

        /// center
        if (center.isNotEmpty)
          for (var cIndex = 0; cIndex < center.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == center[cIndex]) {
                state.result['C'].add(players[playerIndex]);
              }
            }
          }

        AlertHelper.showFlashAlert(
          title: 'Уучлаарай',
          message: 'Та ${secondsToTime(response.data['remaining_seconds'])} минутын дараа дахин санал өгөх боломжтой.',
          status: FlashStatus.failed,
        );
      }
    }
  }

  String secondsToTime(int seconds) {
    final int hour = (seconds / 3600).floor();
    final int minute = ((seconds / 3600 - hour) * 60).floor();

    return [if (hour > 0) hour.toString().padLeft(2, "0"), minute.toString().padLeft(2, "0")].join('цаг ');
  }
}
