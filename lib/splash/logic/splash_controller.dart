import 'dart:developer';
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

  @override
  void onInit() {
    _checkUserToken();

    super.onInit();
  }

  Future<void> _checkUpdate(String timestamp) async {
    dynamic response = await ApiClient.sendRequest(
      '/api/me?ts=$timestamp',
      method: Method.get,
    );
  }

  Future<void> _checkUserToken() async {
    String token = await LocalStorage.getData(Constants.TOKEN) ?? "";
    log('token : $token');
    if (token.isEmpty) {
      await _requestToken();
      _getMetaData();
    } else {
      int timestamp = await LocalStorage.getData(Constants.TIMESTAMP);

      _getMetaData();
    }
  }

  Future<void> _getMetaData() async {
    state.isLoading.value = true;
    dynamic response = await ApiClient.sendRequest(
      '/api/me',
      method: Method.get,
    );
    LocalStorage.saveData(Constants.META_DATA, response.data['result']['meta']);

    if (MezornClientHelper.isValidResponse(response)) {
      LocalStorage.saveData(Constants.TIMESTAMP, response.data['result']['meta']['timestamp']);
    }

    // log('getMetaData :  $response');

    dynamic teams = response.data['result']['meta']['teams'];
    dynamic players = response.data['result']['meta']['players'];
    List<dynamic> metaData = [];
    // log('team : $teams');

    for (var index = 0; index < teams.length; index++) {
      teams[index]..['players'] = [];
      metaData.add(teams[index]);

      for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
        if (teams[index]['code'] == players[playerIndex]['teamCode']) {
          log('setgel : ${metaData[index]} , ${players[playerIndex]}');

          metaData[index]['players'].add(players[playerIndex]);
        }
      }
    }
    log('metaData : $metaData');
    LocalStorage.saveData(Constants.TEAMS, metaData);
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(MyRoutes.voteResult);
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

    log('body : $body');

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
      await LocalStorage.saveData(Constants.TOKEN, response.data['result']['token']);
      String wtf = await LocalStorage.getData(Constants.TOKEN);
      log('wtf : $wtf');
      MezornClientHelper().saveToken = response.data['result']['token'];
    }

    return isSuccess;
  }
}
