import 'package:get/get.dart';

import 'page1_controller.dart';

class Page1Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Page1Controller());
  }
}
