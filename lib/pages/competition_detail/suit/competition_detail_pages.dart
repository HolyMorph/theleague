import 'package:get/get.dart';
import '../logic/competition_detail_binding.dart';
import '../view/competition_detail_screen.dart';
import 'competition_detail_routes.dart';

class CompetitionDetailPages {
  static List<GetPage> pages = [
    GetPage(
      name: CompetitionDetailRoutes.competitionDetailScreen + '/:id',
      page: () => const CompetitionDetailScreen(),
      binding: CompetitionDetailBinding(),
    ),
  ];
}
