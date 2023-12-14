import 'package:get/get.dart';
import '../home/logic/home_binding.dart';
import '../home/view/home_screen.dart';
import '../onboarding/logic/splash_binding.dart';
import '../onboarding/view/splash_screen.dart';
import '../select_league/view/select_league_screen.dart';
import 'my_routes.dart';

class MyPages {
  static final pages = [
    ///Home screen
    GetPage(
      name: MyRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    ///Select League  screen
    GetPage(
      name: MyRoutes.selectLeague,
      page: () => SelectLeagueScreen(),
    ),

    _homeRoute,
    _homeRoute.copy(
      name: MyRoutes.splash,
    ),
  ];

  static GetPage _homeRoute = GetPage(
    name: '/',
    page: () => SplashScreen(),
    binding: SplashBinding(),
  );
}
