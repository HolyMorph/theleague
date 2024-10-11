import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'alert/alert_helper.dart';
import 'firebase_config.dart';
import 'my_app.dart';
import 'pages/core/logic/core_controller.dart';
import 'service/my_client.dart';
import 'utils/constants.dart';
import 'utils/my_storage.dart';

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
  await MyClient.instance.init(baseUrl: Constants.isDevUrl ? Constants.BASE_DEV_URL : Constants.BASE_URL);

  ///Init [LocalStorage] library
  await MyStorage.instance.init();

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

      if (await MyStorage().getData(Constants.FCMToken) != newToken) {
        await MyStorage().saveData('fcmSaved', false);
        await MyStorage().saveData(Constants.FCMToken, newToken);
      } else {
        await MyStorage().saveData('fcmSaved', true);
      }
    },
  );
  await Get.putAsync<CoreController>(() async => CoreController());
}
