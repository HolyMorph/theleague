import 'package:get/get.dart';

import '../auth/logic/auth_binding.dart';
import '../auth/view/login_screen.dart';
import '../auth/view/verify_screen.dart';
import '../demo/demo_screen.dart';
import '../home/logic/home_binding.dart';
import '../home/view/home_screen.dart';
import '../onboarding/logic/splash_binding.dart';
import '../onboarding/view/splash_screen.dart';

class Routes {
  static final routes = [
    ///Splash screen
    GetPage(
      name: '/demo',
      page: () => DemoScreen(),
    ),

    ///Splash screen
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    ///Нэвтрэх дэлгэц
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),

    ///Баталгаажуулах дэлгэц
    GetPage(
      name: '/verify',
      page: () => const VerifyScreen(),
      binding: AuthBinding(),
    ),

    _homeRoute,
    _homeRoute.copy(name: '/home'),
  ];

  static GetPage _homeRoute = GetPage(
    name: '/',
    page: () => HomeScreen(),
    binding: HomeBinding(),
  );
}
