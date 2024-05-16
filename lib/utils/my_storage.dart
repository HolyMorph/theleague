import 'package:get_storage/get_storage.dart';

class MyStorage {
  static final MyStorage _instance = MyStorage._internal();
  factory MyStorage() => _instance;

  MyStorage._internal();

  static MyStorage get instance => _instance;

  ///Local storage box
  static GetStorage? _box;

  ///Init local storage
  Future<void> init() async {
    await GetStorage.init();
    _box = GetStorage('clientStorage');
  }

  ///Get data from local storage
  ///Get data using [key]. If [key] is null, return null
  Future<dynamic> getData(String key) async {
    if (_box == null || key.isEmpty) return null;

    return await _box?.read(key);
  }

  ///Save data to local storage
  ///Save [value] using [key]. If [value] is null, delete [key]
  Future<void> saveData(String key, dynamic value) async {
    assert(_box != null);
    assert(key.isNotEmpty);
    if (value == null) {
      await _box?.remove(key);

      return;
    }
    await _box?.write(key, value);
  }

  ///Clear all local data
  Future<void> clearAllData() async {
    return _box!.erase();
  }
}
