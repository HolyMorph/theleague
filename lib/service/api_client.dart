import 'package:mezorn_api_caller/api_caller.dart';

class ApiClient {
  static final MezornClient _mezornApiClient = MezornClient();

  /// Сервис дуудах production орчны URL.
  static const baseUrl = 'https://app-api.dev.theleague.mn/v1';

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
  static Future<dynamic> sendRequest(
    String url, {
    Method method = Method.post,
    dynamic body,
    dynamic queryParam,
    bool checkServerConnection = false,
    Map<String, dynamic>? header,
    bool? isMultiPart,
  }) async {
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

    return _handleResponse(_response);
  }
}
