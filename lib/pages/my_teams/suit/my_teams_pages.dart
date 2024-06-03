import 'package:get/get.dart';

import '../logic/my_teams_binding.dart';
import '../view/my_teams_screen.dart';
import 'my_teams_routes.dart';

class MyTeamsPages {
  static List<GetPage> pages = [
    GetPage(
      name: MyTeamsRoutes.myTeamsScreen,
      page: () => MyTeamsScreen(),
      binding: MyTeamsBinding(),
    ),
  ];
}
