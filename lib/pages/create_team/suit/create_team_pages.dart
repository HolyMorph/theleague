import 'package:get/get.dart';

import '../logic/create_team_binding.dart';
import '../view/create_team_screen.dart';
import 'create_team_routes.dart';

class CreateTeamPages {
  static List<GetPage> pages = [
    GetPage(
      name: CreateTeamRoutes.createTeamScreen,
      page: () => CreateTeamScreen(),
      binding: CreateTeamBinding(),
    ),
  ];
}
