import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../utils/constants.dart';
import '../utils/my_storage.dart';
import 'method.dart';

class MyClient {
  final Dio _dio = Dio();
  static final MyClient _instance = MyClient._internal();

  factory MyClient() => _instance;
  MyClient._internal();

  static MyClient get instance => _instance;

  ///Init RestAPI client. This method must be called before using [MyClient]. If not, [MyClient] will throw error
  ///
  /// [baseUrl] -> base url for api
  Future<void> init({required String baseUrl}) async {
    assert(Uri.parse(baseUrl).isAbsolute);
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

      return client;
    };
  }

  Future<(bool, dynamic)> sendHttpRequest({
    required String urlPath,
    Method method = Method.get,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    Map<String, dynamic> header = headers ?? {};
    header['accept'] = '*/*';

    ///Get token from local storage and add it to header
    String? token = await MyStorage.instance.getData(Constants.TOKEN);
    if ((token ?? '').isNotEmpty && (header['Authorization'] == null)) {
      header['Authorization'] = '$token';
    }

    ///Create options for request
    var options = Options(
      headers: header,
      method: method.name.toUpperCase(),
    );

    Response? response;
    try {
      ///Send request and return response
      response = await _dio.request(
        _formatUrl(urlPath),
        queryParameters: queryParameters,
        data: body,
        options: options,
      );
    } on DioException catch (e) {
      return (false, e.response?.data);
      // if (e.response?.statusCode == 401) {
      //   bool isUpdated = await updateUserToken();
      //
      //   return isUpdated
      //       ? await sendHttpRequest(urlPath: urlPath, method: method, body: body, queryParameters: queryParameters, headers: headers)
      //       : (false, e.response?.data);
      // } else {
      //   return (false, e.response?.data);
      // }
    } catch (e) {
      if (e is DioException) {
        return (false, e.response?.data);
      }
    }

    int httpStatus = response?.statusCode ?? 0;
    bool isHttpStatusOk = response != null && (httpStatus >= 200 && httpStatus < 300);
    int serviceStatus = int.tryParse('${response?.data['statusCode']}') ?? 200;
    bool isServiceStatusOk = serviceStatus >= 200 && serviceStatus < 300;
    bool isSuccess = isHttpStatusOk && isServiceStatusOk;

    return (isSuccess, response?.data);
  }

  // Future<bool> updateUserToken() async {
  //   String refreshToken = await MyStorage.instance.getData(Constants.REFRESH_TOKEN) ?? '';
  //
  //   if (refreshToken.isEmpty) {
  //     AlertUtils.showWarningFlashAlert(title: 'core_sorry'.tr, body: 'core_login_again'.tr);
  //
  //     route.Get.find<CoreService>().logout();
  //     route.Get.find<CoreService>().coreStatus.value == CoreStatus.auth;
  //
  //     return false;
  //   }
  //
  //   var (isSuccess, response) = await sendHttpRequest(
  //     urlPath: 'v1/app/refresh-token',
  //     method: Method.post,
  //     headers: {'xxx-refresh-token': refreshToken},
  //   );
  //
  //   if (isSuccess) {
  //     MyStorage.instance.saveData(Constants.TOKEN, 'Bearer ${response['data']['token']}');
  //     if (response['data']['refreshToken'] != null) MyStorage.instance.saveData(Constants.REFRESH_TOKEN, response['data']['refreshToken']);
  //
  //     return true;
  //   } else {
  //     AlertUtils.showWarningFlashAlert(title: 'core_sorry'.tr, body: 'core_login_again'.tr);
  //
  //     route.Get.offAllNamed(LoginRoutes.loginWithPhoneScreen);
  //
  //     return false;
  //   }
  // }

  ///Format url to remove '/' at the end of url and encode url for special characters
  String _formatUrl(String url) {
    if ((url).isEmpty) return '';
    String editedUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;

    return Uri.encodeFull(editedUrl);
  }
}
