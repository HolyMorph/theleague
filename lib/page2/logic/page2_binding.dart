import 'package:get/get.dart';

import 'page2_controller.dart';

class Page2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Page2Controller());
  }
}
