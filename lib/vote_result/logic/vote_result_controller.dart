import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';

import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../state/vote_result_state.dart';

class VoteResultController extends GetxController {
  VoteResultState state = VoteResultState();

  Future<void> checkVote() async {
    dynamic response = await ApiClient().sendRequest(
      'api/me/check-vote',
      method: Method.post,
      body: {'gender': state.gender},
    );

    log('checkVote response : $response');
  }

  Future<void> getVoteHistory() async {
    List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];

    dynamic response = await ApiClient().sendRequest('/api/me/vote-history', method: Method.get);

    if (MezornClientHelper.isValidResponse(response)) {
      List<dynamic> histories = response.data['result']['docs'];
      for (var index = 0; index < histories.length; index++) {
        dynamic result = {
          "_id": "",
          "vote": {
            "PG": RxList<Map<String, dynamic>>([]),
            "F": RxList<Map<String, dynamic>>([]),
            "G": RxList<Map<String, dynamic>>([]),
            "C": RxList<Map<String, dynamic>>([]),
          },
          "createdAt": "",
        };
        List<dynamic> pointguard = response.data['result']['docs'][index]['vote']['PG'] ?? [];
        List<dynamic> forward = response.data['result']['docs'][index]['vote']['F'] ?? [];
        List<dynamic> guard = response.data['result']['docs'][index]['vote']['G'] ?? [];
        List<dynamic> center = response.data['result']['docs'][index]['vote']['C'] ?? [];

        result['_id'] = histories[index]['_id'];
        DateTime dateTime = DateTime.parse(histories[index]['createdAt']);
        String formattedDate = DateFormat("M сарын d, HH:mm").format(dateTime);
        result['createdAt'] = formattedDate;

        /// point guard
        if (pointguard.isNotEmpty)
          for (var pgIndex = 0; pgIndex < pointguard.length; pgIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == pointguard[pgIndex]) {
                result['vote']['PG'].add(players[playerIndex]);
              }
            }
          }

        /// forward
        if (forward.isNotEmpty)
          for (var fIndex = 0; fIndex < forward.length; fIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == forward[fIndex]) {
                result['vote']['F'].add(players[playerIndex]);
              }
            }
          }

        /// guard
        if (guard.isNotEmpty)
          for (var gIndex = 0; gIndex < guard.length; gIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == guard[gIndex]) {
                result['vote']['G'].add(players[playerIndex]);
              }
            }
          }

        /// center
        if (center.isNotEmpty)
          for (var cIndex = 0; cIndex < center.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
              if (players[playerIndex]['_id'] == center[cIndex]) {
                result['vote']['C'].add(players[playerIndex]);
              }
            }
          }
        state.voteHistories.add(result);
      }

      log('getVotesHistory response : $response');
    }
  }

  Future<void> getVoteResult() async {
    state.isLoading.value = true;
    dynamic response = await ApiClient().sendRequest('/api/me/vote-result', method: Method.get);

    log('getVoteResult response : $response');
    if (MezornClientHelper.isValidResponse(response)) {
      List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];
      List<dynamic> teams = await LocalStorage.getData(Constants.META_DATA)['teams'];
      List<dynamic> online = response.data['result']['votes']['online'];
      List<dynamic> arena = response.data['result']['votes']['arena'];
      List<dynamic> coach = response.data['result']['votes']['coach'];

      /// Online vote
      for (var index = 0; index < online.length; index++) {
        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (online[index]['value'] == players[playerIndex]['_id']) {
            log('online');
            players[playerIndex]..['score'] = online[index]['score'];
            for (var teamIndex = 0; teamIndex < teams.length; teamIndex++) {
              if (teams[teamIndex]['code'] == players[playerIndex]['teamCode']) {
                if (teams[teamIndex]['gender'] == 'male') {
                  state.onlineVoteResultsMale.add(players[playerIndex]);
                } else {
                  state.onlineVoteResultsFemale.add(players[playerIndex]);
                }
              }
            }
          }
        }
      }

      /// Arena vote
      for (var index = 0; index < arena.length; index++) {
        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (arena[index]['value'] == players[playerIndex]['_id']) {
            log('arena');
            players[playerIndex]..['score'] = arena[index]['score'];
            for (var teamIndex = 0; teamIndex < teams.length; teamIndex++) {
              if (teams[teamIndex]['code'] == players[playerIndex]['teamCode']) {
                if (teams[teamIndex]['gender'] == 'male') {
                  state.arenaVoteResultsMale.add(players[playerIndex]);
                } else {
                  state.arenaVoteResultsFemale.add(players[playerIndex]);
                }
              }
            }
          }
        }
      }

      /// Coach
      for (var index = 0; index < coach.length; index++) {
        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (coach[index]['value'] == players[playerIndex]['_id']) {
            log('coach');
            players[playerIndex]..['score'] = coach[index]['score'];
            for (var teamIndex = 0; teamIndex < teams.length; teamIndex++) {
              if (teams[teamIndex]['code'] == players[playerIndex]['teamCode']) {
                if (teams[teamIndex]['gender'] == 'male') {
                  state.coachVoteResultsMale.add(players[playerIndex]);
                } else {
                  state.coachVoteResultsFemale.add(players[playerIndex]);
                }
              }
            }
          }
        }
      }
    }

    state.isLoading.value = false;
  }

  @override
  void onInit() {
    getVoteHistory();
    getVoteResult();
    super.onInit();
  }

  Future<void> refreshFunction() async {
    state.onlineVoteResultsMale.clear();
    state.onlineVoteResultsFemale.clear();
    state.arenaVoteResultsFemale.clear();
    state.arenaVoteResultsMale.clear();
    state.coachVoteResultsFemale.clear();
    state.coachVoteResultsMale.clear();
    state.voteHistories.clear();
    await getVoteResult();
    await getVoteHistory();
  }
}
