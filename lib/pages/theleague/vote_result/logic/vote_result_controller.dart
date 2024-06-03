import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../state/vote_result_state.dart';

class VoteResultController extends GetxController with GetSingleTickerProviderStateMixin {
  final state = VoteResultState();

  void appInit() async {
    state.gender.value = Get.parameters['gender'] ?? '';
    state.category.value = Get.parameters['category'] ?? '';
    state.gameCode.value = Get.parameters['gameCode'] ?? '';
    state.initLoading.value = true;
    state.teams.value = await MyStorage().getData(Constants.TEAMS);
    await getVoteResult();
    await getVoteHistory();
    state.initLoading.value = false;
  }

  Future<void> getVoteHistory() async {
    state.voteHistories.clear();
    var (isSucces, response) = await MyClient().sendHttpRequest(
      urlPath: 'api/vote/vote-history',
      queryParameters: {'gender': state.gender.value, 'gameCode': state.gameCode.value},
    );

    if (isSucces) {
      List<dynamic> histories = response['result']['docs'];

      for (var index = 0; index < histories.length; index++) {
        dynamic result = {
          "_id": "",
          "gender": state.gender.value,
          "vote": {
            'MB': RxList<Map<String, dynamic>>([]),
            'L': RxList<Map<String, dynamic>>([]),
            'S': RxList<Map<String, dynamic>>([]),
            'OH': RxList<Map<String, dynamic>>([]),
            'OPH': RxList<Map<String, dynamic>>([]),
            'CO': RxList<Map<String, dynamic>>([]),
          },
          "createdAt": "",
        };

        List<dynamic> midBlocker = response['result']['docs'][index]['vote']['MB'] ?? [];
        List<dynamic> libero = response['result']['docs'][index]['vote']['L'] ?? [];
        List<dynamic> setter = response['result']['docs'][index]['vote']['S'] ?? [];
        List<dynamic> outSideHitter = response['result']['docs'][index]['vote']['OH'] ?? [];
        List<dynamic> outSidePowerHitter = response['result']['docs'][index]['vote']['OPH'] ?? [];
        List<dynamic> coach = response['result']['docs'][index]['vote']['CO'] ?? [];

        result['_id'] = histories[index]['_id'];
        DateTime dateTime = DateTime.parse(histories[index]['createdAt']).toLocal();
        String formattedDate = DateFormat("M сарын d, HH:mm").format(dateTime);
        result['createdAt'] = formattedDate;

        if (midBlocker.isNotEmpty)
          for (var pgIndex = 0; pgIndex < midBlocker.length; pgIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == midBlocker[pgIndex]) {
                result['vote']['MB'].add(state.players[playerIndex]);
              }
            }
          }

        if (libero.isNotEmpty)
          for (var fIndex = 0; fIndex < libero.length; fIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == libero[fIndex]) {
                result['vote']['L'].add(state.players[playerIndex]);
              }
            }
          }

        if (setter.isNotEmpty)
          for (var gIndex = 0; gIndex < setter.length; gIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == setter[gIndex]) {
                result['vote']['S'].add(state.players[playerIndex]);
              }
            }
          }

        if (outSideHitter.isNotEmpty)
          for (var cIndex = 0; cIndex < outSideHitter.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == outSideHitter[cIndex]) {
                result['vote']['OH'].add(state.players[playerIndex]);
              }
            }
          }

        if (outSidePowerHitter.isNotEmpty)
          for (var cIndex = 0; cIndex < outSidePowerHitter.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == outSidePowerHitter[cIndex]) {
                result['vote']['OPH'].add(state.players[playerIndex]);
              }
            }
          }

        if (coach.isNotEmpty)
          for (var cIndex = 0; cIndex < coach.length; cIndex++) {
            for (var playerIndex = 0; playerIndex < state.players.length; playerIndex++) {
              if (state.players[playerIndex]['_id'] == coach[cIndex]) {
                result['vote']['CO'].add(state.players[playerIndex]);
              }
            }
          }
        state.voteHistories.add(result);
      }
    }
  }

  Future<void> getVoteResult() async {
    state.onlineVoteResults.clear();

    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: 'api/vote/vote-result',
      queryParameters: {
        'gender': state.gender.value,
        'category': state.category.value,
        'gameCode': state.gameCode.value,
      },
    );

    if (isSuccess) {
      Map<String, dynamic> meta = await MyStorage().getData(Constants.META_DATA);
      state.players.value = await meta['players'];

      List<dynamic> onlineList = [];

      for (var player in state.players) {
        onlineList.add(jsonDecode(jsonEncode(player)));
      }

      /// Online vote
      for (var index = 0; index < response['result']['votes']['online'].length; index++) {
        for (var playerIndex = 0; playerIndex < onlineList.length; playerIndex++) {
          if (response['result']['votes']['online'][index]['value'] == onlineList[playerIndex]['_id']) {
            onlineList[playerIndex]..['score'] = response['result']['votes']['online'][index]['score'];
            state.onlineVoteResults.add(onlineList[playerIndex]);
          }
        }
      }
    }

    state.isLoading.value = false;
  }

  @override
  void onClose() {
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
