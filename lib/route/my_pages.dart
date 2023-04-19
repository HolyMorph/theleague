import 'package:get/get.dart';

import '../auth/logic/login_binding.dart';
import '../auth/view/login_screen.dart';
import '../auth/view/verify_screen.dart';
import '../demo/my_style_guide.dart';
import '../home/logic/home_binding.dart';
import '../home/view/home_screen.dart';
import '../onboarding/logic/splash_binding.dart';
import '../onboarding/view/splash_screen.dart';
import '../page1/logic/page1_binding.dart';
import '../page2/logic/page2_binding.dart';
import 'my_routes.dart';

class MyPages {
  static final pages = [
    ///Demo screen
    GetPage(
      name: MyRoutes.demoScreen,
      page: () => MyStyleGuide(),
    ),

    ///Splash screen
    GetPage(
      name: MyRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    ///Login screen
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),

    ///Verify screen
    GetPage(
      name: MyRoutes.verify,
      page: () => const VerifyScreen(),
      binding: LoginBinding(),
    ),

    _homeRoute,
    _homeRoute.copy(
      name: MyRoutes.home,
    ),
	];

  static GetPage _homeRoute = GetPage(
    name: '/',
    page: () => HomeScreen(),
    binding: HomeBinding(),
    bindings: [
      Page1Binding(),
      Page2Binding(),
    ],
  );
}
