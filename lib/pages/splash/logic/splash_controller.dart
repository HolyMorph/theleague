import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';

import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../firebase_config.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_storage.dart';
import '../../core/logic/core_controller.dart';
import '../../core/suit/core_type.dart';
import '../state/splash_state.dart';

class SplashController extends GetxController {
  final state = SplashState();

  Future<void> checkUserToken() async {
    String token = await MyStorage.instance.getData(Constants.TOKEN) ?? '';
    if (token.isEmpty) {
      await _requestToken();
      Get.find<CoreController>().getMeData();
    } else {
      Get.find<CoreController>().getMeData();
    }

    Get.find<CoreController>().state.coreType.value = CoreType.home;

    ///Notification Token
    ///
    if (await MyStorage().getData('fcmSaved') == false) {
      await _updateFcmToken(token: await MyStorage().getData(Constants.FCMToken));
      FirebaseConfig.subscribeToTopic('theleaguepublic');
    }
  }

  @override
  void onInit() {
    checkUserToken();
    super.onInit();
  }

  // Future<void> _getMetaData() async {

  // state.isLoading.value = true;
  // var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me', method: Method.get);
  //
  // if (isSuccess) {
  //   if (response.data['statusCode'] == 400 || response.data['statusCode'] == 405) {
  //     state.isLoading.value = false;
  //     Get.offNamed(MyRoutes.reloadScreen);
  //
  //     return;
  //   }
  //
  //   MyStorage().saveData(Constants.META_DATA, response.data['result']['meta']);
  //   MyStorage().saveData(Constants.TIMESTAMP, response.data['result']['meta']['timestamp']);
  //   dynamic teams = response.data['result']['meta']['teams'];
  //   dynamic players = response.data['result']['meta']['players'];
  //   List<dynamic> metaData = [];
  //
  //   for (var index = 0; index < teams.length; index++) {
  //     teams[index]..['players'] = [];
  //     metaData.add(teams[index]);
  //
  //     for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
  //       if (teams[index]['code'] == players[playerIndex]['teamCode']) {
  //         metaData[index]['players'].add(players[playerIndex]);
  //       }
  //     }
  //   }
  //
  //   MyStorage().saveData(Constants.TEAMS, metaData);
  //   await Future.delayed(const Duration(seconds: 2));
  //   state.isLoading.value = false;
  //   Get.offNamed(MyRoutes.voteResult);
  // } else {
  //   state.isLoading.value = false;
  //   Get.toNamed(MyRoutes.reloadScreen);
  // }
  //}

  Future<void> _requestToken() async {
    final String osType = Platform.operatingSystem;
    String? phoneModel;
    String? phoneMake;
    String? osVersion;
    DeviceInfoPlugin deviceInfo = await DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      phoneMake = androidInfo.device;
      phoneModel = androidInfo.model;
      osVersion = androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      phoneMake = iosInfo.utsname.machine;
      phoneModel = iosInfo.name;
      osVersion = iosInfo.systemVersion;
    }

    String udid = await FlutterUdid.consistentUdid;

    dynamic body = {
      'appUdId': udid,
      'osType': osType,
      'osVersion': osVersion,
      'phoneMake': phoneMake,
      'phoneModel': phoneModel ?? (osType == 'ios' ? 'iphone' : 'android'),
    };

    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/auth', method: Method.post, body: body);

    if (isSuccess) {
      MyStorage.instance.saveData(Constants.TOKEN, response['result']['token']);
      MyStorage.instance.saveData(Constants.USERTYPE, response['result']['type']);
    } else {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа!',
        message: response.data['message_mn'],
        status: FlashStatus.failed,
      );
    }
  }

  Future<void> _updateFcmToken({required String token}) async {
    final String osType = Platform.operatingSystem;
    dynamic body = {'os_type': osType, "notification_token": token};

    var (isSuccess, _) = await MyClient().sendHttpRequest(
      urlPath: '/api/me/update-pn-token',
      method: Method.post,
      body: body,
    );

    if (isSuccess) {
      MyStorage.instance.saveData(Constants.FCMToken, token);
    }
  }
}
