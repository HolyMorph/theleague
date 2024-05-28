import 'package:get/get.dart';

import '../logic/login_binding.dart';
import '../view/login_screen.dart';
import '../view/verify_screen.dart';
import 'login_routes.dart';

class LoginPages {
  static List<GetPage> pages = [
    GetPage(
      name: LoginRoutes.loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: LoginRoutes.verifyScreen,
      page: () => VerifyScreen(),
    ),
  ];
}
