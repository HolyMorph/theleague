import 'package:get/get.dart';

import '../logic/judge_binding.dart';
import '../view/judge_screen.dart';
import 'judge_routes.dart';

class JudgePages {
  static List<GetPage> pages = [
    GetPage(
      name: JudgeRoutes.judgeScreen,
      page: () => JudgeScreen(),
      binding: JudgeBinding(),
    ),
  ];
}
