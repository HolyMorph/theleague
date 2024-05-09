import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api_caller.dart';
import '../../../../service/api_client.dart';
import '../../../../storage/local_storage.dart';
import '../../../../utils/constants.dart';
import '../state/vote_result_state.dart';

class VoteResultController extends GetxController with GetSingleTickerProviderStateMixin {
  VoteResultState state = VoteResultState();

  void appInit() async {
    state.initLoading.value = true;
    await getVoteResult();
    await getVoteHistory();

    state.tabController = TabController(vsync: this, length: state.tabLength.value);
    state.initLoading.value = false;
  }

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
    state.totalVoteResults.clear();

    state.isLoading.value = true;
    dynamic response = await ApiClient().sendRequest(
      '/api/me/vote-result',
      method: Method.get,
      queryParam: {'gender': state.isMale.value ? 'male' : 'female', 'version': 1.2},
    );

    if (MezornClientHelper.isValidResponse(response)) {
      state.tabLength.value = response.data['result']['showTotal'] ?? false ? 4 : 3;

      List<dynamic> players = await LocalStorage.getData(Constants.META_DATA)['players'];

      List<dynamic> onlineList = [];
      List<dynamic> arenaList = [];
      List<dynamic> coachList = [];
      List<dynamic> totalList = [];

      for (var player in players) {
        onlineList.add(jsonDecode(jsonEncode(player)));
      }

      for (var player in players) {
        arenaList.add(jsonDecode(jsonEncode(player)));
      }

      for (var player in players) {
        coachList.add(jsonDecode(jsonEncode(player)));
      }
      for (var player in players) {
        totalList.add(jsonDecode(jsonEncode(player)));
      }

      /// Online vote
      for (var index = 0; index < response.data['result']['votes']['online'].length; index++) {
        for (var playerIndex = 0; playerIndex < onlineList.length; playerIndex++) {
          if (response.data['result']['votes']['online'][index]['value'] == onlineList[playerIndex]['_id']) {
            onlineList[playerIndex]..['score'] = response.data['result']['votes']['online'][index]['score'];
            state.onlineVoteResults.add(onlineList[playerIndex]);
          }
        }
      }

      /// Arena vote
      for (var index = 0; index < response.data['result']['votes']['arena'].length; index++) {
        for (var playerIndex = 0; playerIndex < arenaList.length; playerIndex++) {
          if (response.data['result']['votes']['arena'][index]['value'] == arenaList[playerIndex]['_id']) {
            arenaList[playerIndex]..['score'] = response.data['result']['votes']['arena'][index]['score'];
            state.arenaVoteResults.add(arenaList[playerIndex]);
          }
        }
      }

      /// Coach
      for (var index = 0; index < response.data['result']['votes']['coach'].length; index++) {
        for (var playerIndex = 0; playerIndex < coachList.length; playerIndex++) {
          if (response.data['result']['votes']['coach'][index]['value'] == coachList[playerIndex]['_id']) {
            coachList[playerIndex]..['score'] = response.data['result']['votes']['coach'][index]['score'];
            state.coachVoteResults.add(coachList[playerIndex]);
          }
        }
      }

      /// Coach
      for (var index = 0; index < response.data['result']['votes']['total'].length; index++) {
        for (var playerIndex = 0; playerIndex < totalList.length; playerIndex++) {
          if (response.data['result']['votes']['total'][index]['value'] == totalList[playerIndex]['_id']) {
            totalList[playerIndex]..['score'] = response.data['result']['votes']['total'][index]['score'];
            state.totalVoteResults.add(totalList[playerIndex]);
          }
        }
      }
    }

    state.isLoading.value = false;
  }

  @override
  void onClose() {
    state.tabController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    appInit();

    super.onInit();
  }

  Future<void> refreshFunction() async {
    await getVoteResult();
    await getVoteHistory();
  }

  // void showForceUpdateDialog() {
  //   Get.dialog(
  //     PopScope(
  //       canPop: false,
  //       child: AlertDialog(
  //         contentPadding: EdgeInsets.zero,
  //         backgroundColor: Color(0xFF272739),
  //         content: Container(
  //           padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(8),
  //             border: Border.all(width: 1, color: Colors.white.withOpacity(0.1)),
  //             color: Color(0xFF272739),
  //           ),
  //           child: Stack(
  //             alignment: Alignment.bottomCenter,
  //             children: [
  //               Positioned(
  //                 top: -75,
  //                 child: Image.asset('assets/images/ic_dialog_body.png', scale: 3),
  //               ),
  //               Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   const SizedBox(height: 100),
  //                   Text(
  //                     'Апп дээр шинэчлэлт гарсан байгаа тул та татаж авна уу. Баярлалаа.',
  //                     textAlign: TextAlign.center,
  //                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'GIP', color: Colors.white),
  //                   ),
  //                   const SizedBox(height: 24),
  //                   Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: [
  //                       Expanded(
  //                         child: ElevatedButton(
  //                           style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF686874)),
  //                           onPressed: () => Get.back(),
  //                           child: Text(
  //                             'Үгүй',
  //                             style: TextStyle(fontFamily: 'GIP', fontWeight: FontWeight.w600),
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(width: 8),
  //                       Expanded(
  //                         child: ElevatedButton(
  //                           style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
  //                           onPressed: () => BasicUtils().urlLaunch(
  //                             '${Platform.isIOS ? 'https://apps.apple.com/us/app/thele%D0%B0gue/id6474849692' : 'https://play.google.com/store/apps/details?id=mn.mezorn.duiz'}',
  //                           ),
  //                           child: Text(
  //                             'Тийм',
  //                             style: TextStyle(fontFamily: 'GIP', fontWeight: FontWeight.w600),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     barrierDismissible: false,
  //   );
  // }
}
