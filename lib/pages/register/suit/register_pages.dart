import 'package:get/get.dart';

import '../logic/register_binding.dart';
import '../view/register_email_screen.dart';
import '../view/register_screen.dart';
import '../view/register_type_screen.dart';
import 'register_routes.dart';

class RegisterPages {
  static List<GetPage> pages = [
    GetPage(
      name: RegisterRoutes.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RegisterRoutes.registerTypeScreen,
      page: () => RegisterTypeScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RegisterRoutes.registerEmailScreen,
      page: () => RegisterEmailScreen(),
    ),
  ];
}
