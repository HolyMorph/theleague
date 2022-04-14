import 'package:mezorn_api_caller/api_caller.dart';

///LocalStorage буюу төхөөрөмж дээр дата
///хадгалах буцааж уншихад зориулагдсан класс
class LocalStorage {
  static late Box localStorage;

  ///LocalStorage тохируулах
  static initLocalStorage() async {
    await Hive.initFlutter();
    localStorage = await Hive.openBox('localStorage');
  }

  ///Төхөөрөмжинд өгөгдөл хадгалах
  ///
  /// [key] -> Тухайн өгөгдлийн хадгалах түлхүүр.
  /// Энэ түлхүүрийг ашиглаж буцааж хадсан өгөгдлөө авна
  ///
  /// [data] -> Тухайн хадгалах гэж буй өгөгдөл
  static Future<void> saveData(String key, dynamic data) async {
    return localStorage.put(key, data);
  }

  ///Хадгалсан өгөгдөл авах функц
  ///
  /// [key] -> Хадгалсан өгөгдлийн түлхүүр үг.
  /// Хэрвээ тухайн [key]-д өгөгдөл байхгүй бол null буцаана.
  static dynamic getData(String key) {
    return localStorage.get(key, defaultValue: null);
  }
}
