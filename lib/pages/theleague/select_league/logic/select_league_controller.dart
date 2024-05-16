import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../service/method.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../state/select_league_state.dart';

class SelectLeagueController extends GetxController {
  final state = SelectLeagueState();

  void set gender(String gender) => state.gender.value = gender;
  void set isCanVote(bool vote) => state.isCanVote.value = vote;
  void set isLoading(bool loading) => state.isLoading.value = loading;

  Future<void> checkVote() async {
    isLoading = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: '/api/me/check-vote',
      method: Method.post,
      body: {'gender': state.gender.value},
    );
    isLoading = false;

    if (isSuccess) {
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
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == pointguard[pgIndex]) {
                state.result['PG'].add(state.players[playerIndex]);
              }
            }
          }

        /// forward
        if (forward.isNotEmpty)
          for (var fIndex = 0; fIndex < forward.length; fIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == forward[fIndex]) {
                state.result['F'].add(state.players[playerIndex]);
              }
            }
          }

        /// guard
        if (guard.isNotEmpty)
          for (var gIndex = 0; gIndex < guard.length; gIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == guard[gIndex]) {
                state.result['G'].add(state.players[playerIndex]);
              }
            }
          }

        /// center
        if (center.isNotEmpty)
          for (var cIndex = 0; cIndex < center.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == center[cIndex]) {
                state.result['C'].add(state.players[playerIndex]);
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

  @override
  void onInit() async {
    state.type.value = Get.parameters['type'] ?? '';
    Map<String, dynamic> meta = await MyStorage().getData(Constants.META_DATA);
    state.players.value = meta['players'];
    super.onInit();
  }

  String secondsToTime(int seconds) {
    final int hour = (seconds / 3600).floor();
    final int minute = ((seconds / 3600 - hour) * 60).floor();

    return [if (hour > 0) hour.toString().padLeft(2, "0"), minute.toString().padLeft(2, "0")].join('цаг ');
  }
}
