import 'package:get/get.dart';
import '../home/logic/home_binding.dart';
import '../home/view/home_screen.dart';
import '../onboarding/logic/splash_binding.dart';
import '../onboarding/view/splash_screen.dart';
import '../select_league/view/select_league_screen.dart';
import '../select_player/logic/select_player_binding.dart';
import '../select_player/view/select_player_screen.dart';
import '../verify_ticket_number/logic/verify_ticket_binding.dart';
import '../verify_ticket_number/view/verify_ticket_screen.dart';
import 'my_routes.dart';

class MyPages {
  static final pages = [
    ///Home screen
    GetPage(
      name: MyRoutes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    ///Verify Ticket number
    GetPage(
      name: MyRoutes.verifyTicket,
      page: () => VerifyTicketScreen(),
      binding: VerifyTicketBinding(),
    ),

    ///Select League  screen
    GetPage(
      name: MyRoutes.selectLeague,
      page: () => const SelectLeagueScreen(),
    ),

    ///Select Player  screen
    GetPage(
      name: MyRoutes.selectPlayer + '/:position',
      page: () => const SelectPlayerScreen(),
      binding: SelectPlayerBinding(),
    ),

    _homeRoute,
    _homeRoute.copy(
      name: MyRoutes.splash,
    ),
  ];

  static GetPage _homeRoute = GetPage(
    name: '/home',
    page: () => SplashScreen(),
    binding: SplashBinding(),
  );
}
