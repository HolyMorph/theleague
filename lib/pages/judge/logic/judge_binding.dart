import 'package:get/get.dart';

import 'judge_controller.dart';

class JudgeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JudgeController>(() => JudgeController());
  }
}
