import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_fcm/mezorn_fcm.dart';

import 'onboarding/splash_screen.dart';
import 'service/api_list.dart';
import 'storage/local_storage.dart';
import 'style/my_theme.dart';
import 'style/my_theme_dark.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Апп-ын анхны тохиргоо болон утгууд өгөх функц.
  _init();

  /// Апп ажиллуулж эхлэх.
  runApp(const MyApp());
}

/// Апп-ын анхны тохиргоо болон утгууд өгөх функц.
void _init() async {
  /// [MezornClient] буюу сервис дуудах санг тохируулах хэсэг.
  await MezornClient.init(
    baseUrl: ApiList.baseUrl,
    debugUrl: ApiList.devUrl,
    isDebug: Constants.isDevUrl,
  );

  /// Мэдэгдлийн тохиргоо хийх.
  await _initNotification();

  /// Төхөөрөмж дээр дата хадгалах модулын тохиргоо.
  await LocalStorage.initLocalStorage();
}

/// [MezornFcm] буюу мэдэгдлийн санг тохируулах функц.
Future<void> _initNotification() async {
  await MezornFcm.initNotificationService(
    /// Тухайн ашиглаж буй мэдэгдлийн сервисийн token авахад дуудагдах функц.
    onTokenRefreshed: (token) {
      // TODO Энд сервер лүү мэдэгдлийн токен илгээх эсэхээ шийднэ.
      log('notificationToken = $token');
    },

    /// Апп нээлттэй үед мэдэгдэл ирвэл дуудагдах функц.
    onNotificationReceived: (message) {
      log('notificationMessage = $message');
    },

    ///Апп background үед мэдэгдэл ирээд тухайн мэдэгдэл
    ///дээр дарж апп нээгдэхэд дуудагдах функц
    onMessageOpenedApp: (message) {
      log('notificationMessageOpenedApp = $message');
    },

    /// Апп background үед мэдэгдэл ирвэл ажиллах функц.
    onBackgroundMessage: handleBackgroundNotification,
  );
}

/// Апп background үед мэдэгдэл ирвэл ажиллах функц.
Future<void> handleBackgroundNotification(dynamic message) async {
  // TODO Апп background байгаа үед мэдэгдэл ирвэл юу хийх вэ гэдэг ээ шийднэ.
  log('backgroundNotificationMessage = $message');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      /// Апп-ын үндсэн загвар.
      theme: MyTheme.mainTheme,

      ///Апп-ын бараан загвар. Хэрвээ дезайн дээр бараан загвар
      ///гараагүй бол null утга өгч болно
      darkTheme: MyThemeDark.darkTheme,

      /// Апп ажиллаад хамгийн эхэнд харагдах дэлгэц.
      home: SplashScreen(),

      /// Апп аль загвараар ажиллах эсэх.
      themeMode: ThemeMode.system,
    );
  }
}
