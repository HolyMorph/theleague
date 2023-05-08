import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';

import 'route/route_index.dart';
import 'service/api_client.dart';
import 'storage/local_storage.dart';
import 'style/style_export.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Апп-ын анхны тохиргоо болон утгууд өгөх функц.
  await _init();

  /// Апп ажиллуулж эхлэх.
  runApp(const MyApp());
}

/// Апп-ын анхны тохиргоо болон утгууд өгөх функц.
Future<void> _init() async {
  /// [MezornClient] буюу сервис дуудах санг тохируулах хэсэг.
  await MezornClient.init(
    baseUrl: ApiClient.baseUrl,
    debugUrl: ApiClient.devUrl,
    isDebug: Constants.isDevUrl,
  );

  /// Төхөөрөмж дээр дата хадгалах модулын тохиргоо.
  await LocalStorage.initLocalStorage();
}

/// Апп background үед мэдэгдэл ирвэл ажиллах функц.
Future<void> handleBackgroundNotification(dynamic message) async {
  // TODO(project): Апп background байгаа үед мэдэгдэл ирвэл юу хийх вэ гэдэг ээ шийднэ.
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
      // home: const DemoScreen(),
      initialRoute: MyRoutes.splash,
      getPages: MyPages.pages,

      /// Апп аль загвараар ажиллах эсэх.
      themeMode: ThemeMode.system,
    );
  }
}
