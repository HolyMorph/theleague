import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';

import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../service/api_client.dart';
import '../../storage/local_storage.dart';
import '../../utils/constants.dart';
import '../state/splash_state.dart';

class SplashController extends GetxController {
  final splashState = SplashState();

  @override
  void onInit() {
    _checkUserToken();

    super.onInit();
  }

  Future<void> _checkUserToken() async {
    String token = MezornClientHelper().token;
    log('token : $token');
    if (token.isEmpty) {
      _requestToken();
    } else {
      _getMetaData();
    }
  }

  Future<void> _getMetaData() async {
    dynamic response = await ApiClient.sendRequest(
      '/api/me',
      method: Method.get,
    );

    if (MezornClientHelper.isValidResponse(response)) {
      LocalStorage.saveData(Constants.TIMESTAMP, response.data['result']['meta']['timestamp']);
    }

    log('getMetaData :  $response');
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

    dynamic response = await ApiClient.sendRequest(
      '/auth/request-token',
      method: Method.post,
      body: body,
    );

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
