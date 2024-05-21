import 'package:get/get.dart';

import 'register_competition_controller.dart';

class RegisterCompetitionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCompetitionController>(() => RegisterCompetitionController());
  }
}
