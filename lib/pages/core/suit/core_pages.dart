import 'package:get/get.dart';
import '../view/core_screen.dart';
import 'core_routes.dart';

class CorePages {
  static List<GetPage> pages = [
    GetPage(
      name: CoreRoutes.coreScreen,
      page: () => const CoreScreen(),
    ),
  ];
}
