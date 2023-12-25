import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';

import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../route/my_routes.dart';
import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../state/splash_state.dart';

class SplashController extends GetxController {
  final state = SplashState();

  Future<void> checkUserToken() async {
    Future.delayed(const Duration(milliseconds: 2500), () async {
      String token = await MezornClientHelper().token;
      if (token.isEmpty) {
        await _requestToken();
        await _getMetaData();
      } else {
        await _getMetaData();
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
    dynamic response = await ApiClient().sendRequest('/api/me', method: Method.get);

    if (MezornClientHelper.isValidResponse(response)) {
      if (response.data['statusCode'] == 400 || response.data['statusCode'] == 405) {
        state.isLoading.value = false;
        Get.offNamed(MyRoutes.reloadScreen);

        return;
      }

      LocalStorage.saveData(Constants.META_DATA, response.data['result']['meta']);
      LocalStorage.saveData(Constants.TIMESTAMP, response.data['result']['meta']['timestamp']);
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

      LocalStorage.saveData(Constants.TEAMS, metaData);
      await Future.delayed(const Duration(seconds: 2));
      state.isLoading.value = false;
      Get.offNamed(MyRoutes.voteResult);
    } else {
      state.isLoading.value = false;
      Get.toNamed(MyRoutes.reloadScreen);
    }
  }

  Future<bool> _requestToken() async {
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

    dynamic response = await ApiClient().sendRequest('/auth/request-token', method: Method.post, body: body);

    if (response.data['statusCode'] == 400 || response.data['statusCode'] == 401) {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа!',
        message: response.data['message_mn'],
        status: FlashStatus.failed,
      );
    }

    bool isSuccess = await MezornClientHelper.isValidResponse(response);

    if (isSuccess) {
      MezornClientHelper().saveToken = response.data['result']['token'];
    }

    return isSuccess;
  }
}
