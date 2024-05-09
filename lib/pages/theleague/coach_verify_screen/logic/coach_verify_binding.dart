import 'package:get/get.dart';

import 'coach_verify_controller.dart';

class CoachVerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoachVerifyController>(() => CoachVerifyController());
  }
}
