import 'package:get/get.dart';

import 'competition_detail_controller.dart';

class CompetitionDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompetitionDetailController>(() => CompetitionDetailController());
  }
}
