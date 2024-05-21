import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'pages/competition_detail/suit/competition_detail_pages.dart';
import 'pages/core/suit/core_pages.dart';
import 'pages/core/suit/core_routes.dart';
import 'pages/register_competition/suit/register_competition_pages.dart';
import 'route/my_pages.dart';
import 'style/my_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      /// Main theme
      theme: MyTheme.instance.themeData,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.topLevel,
      initialRoute: CoreRoutes.coreScreen,
      getPages: MyPages.pages
        ..addAll(CorePages.pages)
        ..addAll(RegisterCompetitionPages.pages)
        ..addAll(CompetitionDetailPages.pages),
    );
  }
}
