import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';

import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../firebase_config.dart';
import '../../../route/my_routes.dart';
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
    Future.delayed(const Duration(milliseconds: 2500), () async {
      Get.find<CoreController>().state.coreType.value = CoreType.home;
      // String token = await MyStorage.instance.getData(Constants.TOKEN);
      // if (token.isEmpty) {
      //   await _requestToken();
      //   await _getMetaData();
      // } else {
      //   await _getMetaData();
      // }

      ///Notification Token
      ///
      if (await MyStorage().getData('fcmSaved') == false) {
        await _updateFcmToken(token: await MyStorage().getData(Constants.FCMToken));
        FirebaseConfig.subscribeToTopic('theleaguepublic');
      }
    });
  }

  @override
  void onInit() {
    checkUserToken();

    super.onInit();
  }

  Future<void> _getMetaData() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me', method: Method.get);

    if (isSuccess) {
      if (response.data['statusCode'] == 400 || response.data['statusCode'] == 405) {
        state.isLoading.value = false;
        Get.offNamed(MyRoutes.reloadScreen);

        return;
      }

      MyStorage().saveData(Constants.META_DATA, response.data['result']['meta']);
      MyStorage().saveData(Constants.TIMESTAMP, response.data['result']['meta']['timestamp']);
      dynamic teams = response.data['result']['meta']['teams'];
      dynamic players = response.data['result']['meta']['players'];
      List<dynamic> metaData = [];

      for (var index = 0; index < teams.length; index++) {
        teams[index]..['players'] = [];
        metaData.add(teams[index]);

        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (teams[index]['code'] == players[playerIndex]['teamCode']) {
            metaData[index]['players'].add(players[playerIndex]);
          }
        }
      }

      MyStorage().saveData(Constants.TEAMS, metaData);
      await Future.delayed(const Duration(seconds: 2));
      state.isLoading.value = false;
      Get.offNamed(MyRoutes.voteResult);
    } else {
      state.isLoading.value = false;
      Get.toNamed(MyRoutes.reloadScreen);
    }
  }

  Future<void> _requestToken() async {
    final String osType = Platform.operatingSystem;
    final String osVersion = Platform.operatingSystemVersion;
    String? phoneModel;
    String? phoneMake;
    DeviceInfoPlugin deviceInfo = await DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      phoneMake = androidInfo.device;
      phoneModel = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      phoneMake = iosInfo.utsname.machine;
      phoneModel = iosInfo.name;
    }
    String udid = await FlutterUdid.consistentUdid;

    dynamic body = {
      'appUdId': udid,
      'osType': osType,
      'osVersion': osVersion,
      'phoneMake': phoneMake,
      'phoneModel': phoneModel ?? (osType == 'ios' ? 'iphone' : 'android'),
    };

    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/auth/request-token', method: Method.post, body: body);

    if (response.data['statusCode'] == 400 || response.data['statusCode'] == 401) {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа!',
        message: response.data['message_mn'],
        status: FlashStatus.failed,
      );
    }

    if (isSuccess) {
      MyStorage.instance.saveData(Constants.TOKEN, response.data['result']['token']);
      MyStorage.instance.saveData(Constants.REFRESH_TOKEN, response.data['result']['refreshToken']);
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
