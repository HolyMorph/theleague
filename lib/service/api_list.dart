import 'package:mezorn_api_caller/api_caller.dart';

class ApiList {
  static final ApiList _singleton = ApiList._internal();
  factory ApiList() => _singleton;
  ApiList._internal();

  final MezornClient _mezornApiClient = MezornClient();

  ///Сервис дуудах production орчны URL
  static const baseUrl = 'https://base.url.here';

  ///Сервис дуудах хөгжүүлэлтийн орчны URL
  static const devUrl = 'https://dev.url.here';

  //----------------------------------------------------

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
  /// [isBasicAuth] -> сервис дуудахдаа username password ашиглах эсэх
  ///
  /// [authUser] -> сервис дуудахдаа basicAuth ашиглаж байгаа үеийн userName
  ///
  /// [authPassword] -> сервис дуудахдаа basicAuth ашиглаж байгаа үеийн password
  ///
  /// [header] -> сервис дээр нэмэлтээр header зааж өгөхөөр бол ашиглана
  ///
  /// [isMultiPart] -> сервисийн contentType-ийг multipart төрлөөр илгээх эсэх
  Future<dynamic> _sendRequest(
    String url, {
    Method method = Method.POST,
    dynamic body,
    dynamic queryParam,
    bool checkServerConnection = false,
    Map<String, dynamic>? header,
    bool? isMultiPart,
    bool isBasicAuth = false,
    String? authUser,
    String? authPassword,
  }) async {
    Response? _response;

    _response = await _mezornApiClient.sendRequest(
      url,
      method: method,
      body: body,
      queryParam: queryParam,
      checkServerConnection: checkServerConnection,
      isBasicAuth: isBasicAuth,
      authUser: authUser,
      authPassword: authPassword,
      isMultiPart: isMultiPart,
      header: header,
    );
    return _handleResponse(_response);
  }

  ///Сервис дуудаад ирэх хариуг жигдрүүлж буцаах функц.
  ///
  /// [response] серверээс ирсэн хариу
  ///
  ///Бүх хүсэлт нэгэн жигд ирж чадаж байгаа бол энэ функц
  ///дотор шинээр код бичих шаардлагагүй
  Future<dynamic> _handleResponse(dynamic response) async {
    return response;
  }

  /// ╔════════════════════════════════════════════════════════════════════════════╗
  /// ║ Үндсэн сервисүүд                                                           ║
  /// ║                                                                            ║
  /// ║                                                                            ║
  /// ║                                                                            ║
  /// ╚════════════════════════════════════════════════════════════════════════════╝

  ///Жишээ хүсэлт илгээх функц
  Future<dynamic> sendTempRequest() async => _sendRequest(
        'tempRequest',
        method: Method.POST,
        body: {'data1': '1', 'data2': 2},
      );
}
