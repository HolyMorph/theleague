import 'package:get/get_navigation/src/routes/get_route.dart';

import '../logic/edit_team_binding.dart';
import '../view/edit_team_screen.dart';
import 'edit_team_routes.dart';

class EditTeamPages {
  static List<GetPage> pages = [
    GetPage(
      name: EditTeamRoutes.editTeamScreen + '/:code',
      page: () => EditTeamScreen(),
      binding: EditTeamBinding(),
    ),
  ];
}
