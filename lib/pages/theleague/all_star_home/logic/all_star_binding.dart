import 'package:get/get.dart';

import 'all_star_controller.dart';

class AllStarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllStarController>(() => AllStarController());
  }
}
