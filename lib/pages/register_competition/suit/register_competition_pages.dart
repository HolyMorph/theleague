import 'package:get/get.dart';

import '../logic/register_competition_binding.dart';
import '../view/register_competition_confirmation.dart';
import '../view/register_competition_screen.dart';
import 'register_competition_routes.dart';

class RegisterCompetitionPages {
  static List<GetPage> pages = [
    GetPage(
      name: RegisterCompetitionRoutes.registerCompetitionScreen + '/:id',
      page: () => RegisterCompetitionScreen(),
      binding: RegisterCompetitionBinding(),
    ),
    GetPage(
      name: RegisterCompetitionRoutes.registerCompetitionConfirmation,
      page: () => RegisterCompetitionConfirmation(),
      binding: RegisterCompetitionBinding(),
    ),
  ];
}
