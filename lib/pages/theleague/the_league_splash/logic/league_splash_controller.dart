import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../route/my_routes.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../state/league_splash_state.dart';

class LeagueSplashController extends GetxController {
  final state = LeagueSplashState();

  @override
  void onInit() async {
    state.gameCode.value = Get.parameters['gameCode'] ?? '';
    state.category.value = Get.parameters['category'] ?? '';
    state.gender.value = Get.parameters['gender'] ?? '';
    _getMetaData();
    // if (await MyStorage.instance.getData(Constants.TIMESTAMP) == null)
    //   _getMetaData();
    // else
    //   _getMetaTimeStamp();
    super.onInit();
  }

  Future<void> _getMetaData() async {
    await Future.delayed(2.seconds);
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: '/api/vote/me',
      queryParameters: {'category': state.category.value, 'gameCode': state.gameCode.value},
    );

    if (isSuccess) {
      if (response['result']['meta'] == null || response['result']['meta'] == {}) {
        state.isLoading.value = false;
        AlertHelper.showFlashAlert(title: 'Алдаа', message: response['message'] ?? 'Хүсэлт амжилтгүй.');
        Get.back();
        return;
      }

      await MyStorage().saveData(Constants.META_DATA, response['result']['meta']);
      await MyStorage().saveData(Constants.TIMESTAMP, response['result']['meta']['timestamp']);

      dynamic teams = response['result']['meta']['teams'];
      dynamic players = response['result']['meta']['players'];

      List<dynamic> metaData = [];
      for (var index = 0; index < teams.length; index++) {
        teams[index]..['players'] = [];
        metaData.add(teams[index]);

        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (teams[index]['code'].toLowerCase() == players[playerIndex]['teamCode'].toLowerCase()) {
            metaData[index]['players'].add(players[playerIndex]);
          }
        }
      }

      await MyStorage().saveData(Constants.TEAMS, metaData);
      await Future.delayed(2.seconds);
      state.isLoading.value = false;
      Get.offNamed(MyRoutes.voteResult + '/${state.category.value}/${state.gameCode.value}/${state.gender.value}');
    } else {
      state.isLoading.value = false;
      AlertHelper.showFlashAlert(title: 'Алдаа', message: response['message'] ?? 'Хүсэлт амжилтгүй');
      Get.back();
    }
  }

  // Future<void> _getMetaTimeStamp() async {
  //   await Future.delayed(2.seconds);
  //   dynamic timeStamp = await MyStorage.instance.getData(Constants.TIMESTAMP);
  //   state.isLoading.value = true;
  //   var (isSuccess, response) = await MyClient().sendHttpRequest(
  //     urlPath: '/api/vote/me',
  //     queryParameters: {
  //       'category': state.category.value,
  //       'gameCode': state.gameCode.value,
  //       'ts': timeStamp,
  //     },
  //   );
  //
  //   if (isSuccess) {
  //     if (response['result']['meta'] == null || response['result']['meta'] == {}) {
  //       await MyStorage().saveData(Constants.TIMESTAMP, null);
  //       state.isLoading.value = false;
  //       AlertHelper.showFlashAlert(
  //         title: 'Алдаа',
  //         message: response['message'] ?? 'Хүсэлт амжилтгүй',
  //         status: FlashStatus.failed,
  //       );
  //       Get.back();
  //       return;
  //     } else {}
  //   } else {
  //     state.isLoading.value = false;
  //     AlertHelper.showFlashAlert(title: 'Алдаа', message: response['message'] ?? 'Хүсэлт амжилтгүй');
  //     Get.back();
  //   }
  // }

  // Future<void> addNewData(String key, Map<String, dynamic> newData) async {
  //   final localStorage = await MyStorage();
  //
  //   dynamic existingDataString = localStorage.getData(key);
  //   Map<String, dynamic> existingData = {};
  //
  //   if (existingDataString != null) {
  //     existingData = Map<String, dynamic>.from(jsonDecode(existingDataString));
  //   }
  //   existingData.addAll(newData);
  //
  //   await prefs.setString(key, jsonEncode(existingData));
  // }
}
