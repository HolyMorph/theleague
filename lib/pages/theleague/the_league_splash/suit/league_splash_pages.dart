import 'package:get/get.dart';

import '../logic/league_splash_binding.dart';
import '../view/league_splash_screen.dart';
import 'league_splash_routes.dart';

class LeagueSplashPages {
  static List<GetPage> pages = [
    GetPage(
      name: LeagueSplashRoutes.leagueSplashScreen + '/:category' + '/:gameCode' + '/:gender',
      page: () => LeagueSplashScreen(),
      binding: LeagueSplashBinding(),
    ),
  ];
}
