import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'route/my_pages.dart';
import 'route/my_routes.dart';
import 'storage/local_storage.dart';
import 'style/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    LocalStorage.initLocalStorage();

    return GetMaterialApp(
      /// Main theme
      theme: MyTheme.instance.themeData,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.topLevel,
      // initialRoute: MyRoutes.splash,
      initialRoute: MyRoutes.playerDetailScreen,
      getPages: MyPages.pages,
    );
  }
}
