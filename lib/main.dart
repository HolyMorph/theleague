import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';

import 'my_app.dart';
import 'service/api_client.dart';
import 'storage/local_storage.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Setup app settings
  await _init();

  /// Start app
  runApp(const MyApp());
}

/// Setup app settings
Future<void> _init() async {
  /// Init [MezornClient] library
  await MezornClient.init(
    baseUrl: ApiClient.baseUrl,
    debugUrl: ApiClient.devUrl,
    isDebug: Constants.isDevUrl,
  );

  ///Init [LocalStorage] library
  await LocalStorage.initLocalStorage();
}
