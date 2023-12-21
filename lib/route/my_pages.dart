import 'package:get/get.dart';

import '../home/logic/home_binding.dart';
import '../home/view/home_screen.dart';
import '../onboarding/logic/onboarding_binding.dart';
import '../onboarding/view/onboarding_screen.dart';
import '../select_league/view/select_league_screen.dart';
import '../select_player/view/select_player_screen.dart';
import '../splash/logic/splash_binding.dart';
import '../splash/view/splash_screen.dart';
import '../verify_ticket_number/logic/verify_ticket_binding.dart';
import '../verify_ticket_number/view/verify_ticket_screen.dart';
import '../vote_result/view/vote_result_screen.dart';
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

    /// Onboarding screen which is basically first page after splash
    GetPage(
      name: MyRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),

    ///Select League  screen
    GetPage(
      name: MyRoutes.selectLeague,
      page: () => const SelectLeagueScreen(),
    ),

    ///Select Player  screen
    GetPage(
      name: MyRoutes.selectPlayer,
      page: () => const SelectPlayerScreen(),
    ),

    /// Splash screen
    GetPage(
      name: MyRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    /// Vote result screen
    GetPage(
      name: MyRoutes.voteResult,
      page: () => VoteResultScreen(),
    ),
  ];
}
