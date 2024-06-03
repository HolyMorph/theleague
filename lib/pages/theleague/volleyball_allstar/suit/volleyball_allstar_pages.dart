import 'package:get/get.dart';
import '../logic/volleyball_allstar_binding.dart';
import '../view/volleyball_allstar_screen.dart';
import 'volleyball_allstar_routes.dart';

class VolleyballAllStarPages {
  static List<GetPage> pages = [
    GetPage(
      name: VolleyBallAllStarRoutes.volleyBallAllStarScreen + '/:gender' + '/:category' + '/:gameCode',
      page: () => VolleyBallAllStarScreen(),
      binding: VolleyBallAllStarBinding(),
    ),
  ];
}
