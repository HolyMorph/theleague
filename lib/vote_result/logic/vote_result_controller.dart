import 'dart:developer';

import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';

import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../state/vote_result_state.dart';

class VoteResultController extends GetxController {
  VoteResultState state = VoteResultState();

  Future<void> checkVote() async {
    dynamic response = await ApiClient.sendRequest(
      'api/me/check-vote',
      method: Method.post,
      body: {'gender': state.gender},
    );

    log('checkVote response : $response');
  }

  Future<void> getVoteResult() async {
    dynamic response = await ApiClient.sendRequest(
      '/api/me/vote-result',
      method: Method.get,
    );

    log('getVoteResult response : $response');
    if (MezornClientHelper.isValidResponse(response)) {
      List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];
      log('players : $players');
      List<dynamic> online = response.data['result']['votes']['online'];
      List<dynamic> arena = response.data['result']['votes']['arena'];
      List<dynamic> coach = response.data['result']['votes']['coach'];

      /// Online vote
      for (var index = 0; index < online.length; index++) {
        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (online[index]['value'] == players[playerIndex]['_id']) {
            log('online');
            players[playerIndex]..['score'] = online[index]['score'];
            state.onlineVoteResults.add(players[playerIndex]);
          }
        }
      }

      /// Arena vote
      for (var index = 0; index < arena.length; index++) {
        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (arena[index]['value'] == players[playerIndex]['_id']) {
            log('arena');
            players[playerIndex]..['score'] = arena[index]['score'];
            state.arenaVoteResults.add(players[playerIndex]);
          }
        }
      }

      /// Coach
      for (var index = 0; index < coach.length; index++) {
        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (coach[index]['value'] == players[playerIndex]['_id']) {
            log('coach');
            players[playerIndex]..['score'] = coach[index]['score'];
            state.arenaVoteResults.add(players[playerIndex]);
          }
        }
      }
    }

    state.isLoading.value = false;
  }

  @override
  void onInit() {
    getVoteResult();
    super.onInit();
  }
}
