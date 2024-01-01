import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api_caller.dart';
import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../../utils/basic_utils.dart';
import '../../utils/constants.dart';
import '../state/vote_result_state.dart';

class VoteResultController extends GetxController {
  VoteResultState state = VoteResultState();

  Future<void> getVoteHistory() async {
    state.voteHistories.clear();
    List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];
    dynamic response = await ApiClient().sendRequest(
      '/api/me/vote-history',
      queryParam: {'gender': state.isMale.value ? 'male' : 'female'},
      method: Method.get,
    );

    if (MezornClientHelper.isValidResponse(response)) {
      List<dynamic> histories = response.data['result']['docs'];
      for (var index = 0; index < histories.length; index++) {
        dynamic result = {
          "_id": "",
          "gender": state.gender.value,
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
        DateTime dateTime = DateTime.parse(histories[index]['createdAt']).toLocal();
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
    }
  }

  Future<void> getVoteResult() async {
    state.onlineVoteResults.clear();
    state.arenaVoteResults.clear();
    state.coachVoteResults.clear();

    state.isLoading.value = true;
    dynamic response = await ApiClient().sendRequest(
      '/api/me/vote-result',
      method: Method.get,
      queryParam: {'gender': state.isMale.value ? 'male' : 'female'},
    );

    if (MezornClientHelper.isValidResponse(response)) {
      List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];
      List<dynamic> teams = await LocalStorage.getData(Constants.META_DATA)['teams'];
      List<dynamic> online = response.data['result']['votes']['online'];
      List<dynamic> arena = response.data['result']['votes']['arena'];
      List<dynamic> coach = response.data['result']['votes']['coach'];

      List<dynamic> onlineList = List.from(await LocalStorage.getData(Constants.META_DATA)['players']);
      List<dynamic> arenaList = List.from(await LocalStorage.getData(Constants.META_DATA)['players']);
      List<dynamic> coachList = List.from(await LocalStorage.getData(Constants.META_DATA)['players']);

      // List<dynamic> onlineList = [];
      // List<dynamic> arenaList = [];
      // List<dynamic> coachList = [];
      //
      // for (var player in players) {
      //   onlineList.add(player);
      //   arenaList.add(player);
      //   coachList.add(player);
      // }

      /// Online vote
      for (var index = 0; index < online.length; index++) {
        for (var playerIndex = 0; playerIndex < onlineList.length; playerIndex++) {
          if (online[index]['value'] == onlineList[playerIndex]['_id']) {
            log('online');
            onlineList[playerIndex]..['score'] = online[index]['score'];
            for (var teamIndex = 0; teamIndex < teams.length; teamIndex++) {
              if (teams[teamIndex]['code'] == onlineList[playerIndex]['teamCode']) {
                state.onlineVoteResults.add(onlineList[playerIndex]);
              }
            }
          }
        }
      }

      /// Arena vote
      for (var index = 0; index < arena.length; index++) {
        log('arena');
        for (var playerIndex = 0; playerIndex < arenaList.length; playerIndex++) {
          if (arena[index]['value'] == arenaList[playerIndex]['_id']) {
            arenaList[playerIndex]..['score'] = arena[index]['score'];
            for (var teamIndex = 0; teamIndex < teams.length; teamIndex++) {
              if (teams[teamIndex]['code'] == arenaList[playerIndex]['teamCode']) {
                log('player: ${arenaList[playerIndex]}');
                state.arenaVoteResults.add(arenaList[playerIndex]);
              }
            }
          }
        }
      }

      /// Coach
      for (var index = 0; index < coach.length; index++) {
        for (var playerIndex = 0; playerIndex < coachList.length; playerIndex++) {
          if (coach[index]['value'] == coachList[playerIndex]['_id']) {
            log('coach');
            coachList[playerIndex]..['score'] = coach[index]['score'];
            for (var teamIndex = 0; teamIndex < teams.length; teamIndex++) {
              if (teams[teamIndex]['code'] == coachList[playerIndex]['teamCode']) {
                state.coachVoteResults.add(coachList[playerIndex]);
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
    await getVoteResult();
    await getVoteHistory();
  }

  void showForceUpdateDialog() {
    Get.dialog(
      PopScope(
        canPop: false,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Color(0xFF272739),
          content: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: Colors.white.withOpacity(0.1)),
              color: Color(0xFF272739),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: -75,
                  child: Image.asset('assets/images/ic_dialog_body.png', scale: 3),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      'Апп дээр шинэчлэлт гарсан байгаа тул та татаж авна уу. Баярлалаа.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'GIP', color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF686874)),
                            onPressed: () => Get.back(),
                            child: Text(
                              'Үгүй',
                              style: TextStyle(fontFamily: 'GIP', fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                            onPressed: () => BasicUtils().urlLaunch(
                              '${Platform.isIOS ? 'https://apps.apple.com/us/app/thele%D0%B0gue/id6474849692' : 'https://play.google.com/store/apps/details?id=mn.mezorn.duiz'}',
                            ),
                            child: Text(
                              'Тийм',
                              style: TextStyle(fontFamily: 'GIP', fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
