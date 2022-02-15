import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_dummy/demo/demo_screen.dart';
import 'package:mezorn_dummy/onboarding/splash_screen.dart';
import 'package:mezorn_dummy/service/api_list.dart';
import 'package:mezorn_dummy/storage/local_storage.dart';
import 'package:mezorn_dummy/style/my_themes.dart';
import 'package:mezorn_dummy/utils/constants.dart';
import 'package:mezorn_fcm/mezorn_fcm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Апп-ын анхны тохиргоо болон утгууд өгөх функц
  _init();

  ///Апп ажиллуулж эхлэх
  runApp(const MyApp());
}

///Апп-ын анхны тохиргоо болон утгууд өгөх функц
_init() async {
  ///[MezornClient] буюу сервис дуудах санг тохируулах хэсэг
  await MezornClient.init(
    baseUrl: ApiList.baseUrl,
    debugUrl: ApiList.devUrl,
    isDebug: Constants.isDevUrl,
  );

  ///Мэдэгдлий тохиргоо хийх
  await _initNotification();

  ///Төхөөрөмж дээр дата хадгалах модулын тохиргоо
  await LocalStorage.initLocalStorage();
}

///[MezornFcm] буюу мэдэгдлийн санг тохируулах функц
_initNotification() async {
  await MezornFcm.initNotificationService(
    ///Тухайн ашиглаж буй мэдэгдлийн сервисийн token авахад дуудагдах функц
    onTokenRefreshed: (token) {
      //Энд сервер лүү мэдэгдлийн токен илгээх эсэхээ шийднэ
      log('notificationToken = $token');
    },

    ///Апп нээлттэй үед мэдэгдэл ирвэл дуудагдах функц
    onNotificationReceived: (message) {
      log('notificationMessage = $message');
    },

    ///Апп background үед мэдэгдэл ирээд тухайн мэдэгдэл
    ///дээр дарж апп нээгдэхэд дуудагдах функц
    onMessageOpenedApp: (message) {
      log('notificationMessageOpenedApp = $message');
    },

    ///Апп background үед мэдэгдэл ирвэл ажиллах функц
    onBackgroundMessage: _handleBackgroundNotification,
  );
}

///Апп background үед мэдэгдэл ирвэл ажиллах функц
Future<void> _handleBackgroundNotification(dynamic message) async {
  //Апп background байгаа үед мэдэгдэл ирвэл юу хийх вэ гэдэг ээ шийднэ
  log('backgroundNotificationMessage = $message');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      ///Апп-ын үндсэн загвар
      theme: MyThemes.mainTheme,

      ///Апп-ын бараан загвар
      darkTheme: MyThemes.darkTheme,

      ///Апп ажиллаад хамгийн эхэнд харагдах дэлгэц
      home: const DemoScreen(),

      ///Апп аль загвараар ажиллах эсэх
      themeMode: ThemeMode.system,
    );
  }
}
