import 'package:get/get.dart';
import '../logic/competition_parent_binding.dart';
import '../view/competition_parent_screen.dart';
import 'competition_parent_routes.dart';

class CompetitionParentPages {
  static List<GetPage> pages = [
    GetPage(
      name: CompetitionParentRoutes.competitionParentScreen + '/:id',
      page: () => const CompetitionParentScreen(),
      binding: CompetitionParentBinding(),
    ),
  ];
}
