import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart' as route;
import 'package:mezorn_api_caller/api_caller.dart';

import '../route/my_routes.dart';

class ApiClient {
  static final MezornClient _mezornApiClient = MezornClient();
  final route.RxBool isRefreshCalled = route.RxBool(false);

  /// Сервис дуудах production орчны URL.
  static const baseUrl = 'https://app-api.theleague.mn/v1';

  /// Сервис дуудах хөгжүүлэлтийн орчны URL.
  static const devUrl = 'https://app-api.dev.theleague.mn/v1';

  //----------------------------------------------------

  ///Сервис дуудаад ирэх хариуг жигдрүүлж буцаах функц.
  ///
  /// [response] серверээс ирсэн хариу
  ///
  ///Бүх хүсэлт нэгэн жигд ирж чадаж байгаа бол энэ функц
  ///дотор шинээр код бичих шаардлагагүй
  static Future<dynamic> _handleResponse(dynamic response) async {
    return response;
  }

  ///RestAPI хүсэлт илгээх функц
  ///
  /// [url] -> сервис дуудах url. Энэ санг анх init хийхдээ үндсэн url заагаад
  /// өгчихсөн бол нэмэлт path нь байхад болно. Үндсэн хаягнаас өөр хаяг руу сервис
  /// дуудахаар бол бүтэн url бичиж өгч болно.
  /// Жишээ нь: auth/login, auth/register бүр эсвэл https://payment.my.com/invoice/create гэх мэт
  ///
  /// [method] -> хүсэлтийг ямар method-р дуудах
  ///
  /// [body] -> хүсэлтийн body-д дамжуулж өгөх утга
  ///
  /// [queryParam] -> хүсэлтийн query-д дамжуулж өгөх утга
  ///
  /// [checkServerConnection] -> сервертэй холбоотой байгаа эсэхийг шалгах эсэх.
  /// Хэрвээ true байвал сервертэй холбоотой байгаа эсэхийг шалгаад интернэт
  /// холбогдсон байгаа ч гэсэн сервертэй холбогдож чадахгүй
  /// бол интернэт холболт тасарсан гэж хариу илгээнэ
  ///
  /// [header] -> сервис дээр нэмэлтээр header зааж өгөхөөр бол ашиглана
  ///
  /// [isMultiPart] -> сервисийн contentType-ийг multipart төрлөөр илгээх эсэх
  Future<dynamic> sendRequest(
    String url, {
    Method method = Method.post,
    dynamic body,
    dynamic queryParam,
    bool checkServerConnection = false,
    Map<String, dynamic>? header,
    bool? isMultiPart,
  }) async {
    log('SendRequest url: $url , $method');

    if (body != null) {
      log('SendRequest body: $body');
    }
    if (queryParam != null) {
      log('SendRequest queryParam: $queryParam');
    }

    Response? _response;

    _response = await _mezornApiClient.sendRequest(
      url,
      method: method,
      body: body,
      queryParam: queryParam,
      checkServerConnection: checkServerConnection,
      isMultiPart: isMultiPart,
      header: header,
    );

    if (_response?.statusCode == 401) {
      bool _isUpdated = await updateUserToken();

      return _isUpdated
          ? sendRequest(
              url,
              method: method,
              body: body,
              queryParam: queryParam,
              checkServerConnection: checkServerConnection,
              header: header,
              isMultiPart: isMultiPart,
            )
          : null;
    } else {
      return _handleResponse(_response);
    }
  }

  Future<bool> updateUserToken() async {
    if (isRefreshCalled.value) {
      return false;
    }

    isRefreshCalled.value = true;
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

    if (await MezornClientHelper().refreshToken.isEmpty) {
      MezornClientHelper().saveToken = '';
      route.Get.offAllNamed(MyRoutes.splash);

      return false;
    }

    dynamic response = await sendRequest(
      '/auth/refresh-token',
      method: Method.post,
      body: body,
      header: {'Authorization': '${MezornClientHelper().refreshToken}'},
    );

    isRefreshCalled.value = false;

    if (MezornClientHelper.isValidResponse(response)) {
      var token = response.data['result']['token'];
      var refresh_token = response.data['result']['refreshToken'];

      MezornClientHelper().token = token;
      MezornClientHelper().refreshToken = refresh_token;

      return true;
    } else {
      return false;
    }
  }
}
