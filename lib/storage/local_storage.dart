import 'package:get_storage/get_storage.dart';

///LocalStorage буюу төхөөрөмж дээр дата
///хадгалах буцааж уншихад зориулагдсан класс
class LocalStorage {
  static late GetStorage localStorage;

  static Future<void> clear() async {
    return localStorage.erase();
  }

  ///Хадгалсан өгөгдөл авах функц
  ///
  /// [key] -> Хадгалсан өгөгдлийн түлхүүр үг.
  /// Хэрвээ тухайн [key]-д өгөгдөл байхгүй бол null буцаана.
  static dynamic getData(String key) {
    return localStorage.read(key);
  }

  /// LocalStorage тохируулах.
  static Future<void> initLocalStorage() async {
    await GetStorage.init();
    localStorage = GetStorage('localStorage');
  }

  ///Төхөөрөмжинд өгөгдөл хадгалах
  ///
  /// [key] -> Тухайн өгөгдлийн хадгалах түлхүүр.
  /// Энэ түлхүүрийг ашиглаж буцааж хадгалсан өгөгдлөө авна
  ///
  /// [data] -> Тухайн хадгалах гэж буй өгөгдөл
  static Future<void> saveData(String key, dynamic data) async {
    return localStorage.write(key, data);
  }
}
