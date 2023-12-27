import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';

import 'alert/alert_helper.dart';
import 'firebase_config.dart';
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

  ///Init Firebase
  await FirebaseConfig.initFirebase(
    onNotificationReceived: (message) {
      AlertHelper.showFlashAlert(
        title: message.notification?.title ?? 'The League',
        message: message.notification?.body ?? '',
      );
    },
    onTokenRefreshed: (newToken) async {
      log('fcm Token : ${newToken}');

      if (await LocalStorage.getData(Constants.FCMToken) != newToken) {
        await LocalStorage.saveData('fcmSaved', false);
        await LocalStorage.saveData(Constants.FCMToken, newToken);
      } else {
        await LocalStorage.saveData('fcmSaved', true);
      }
    },
  );
}
