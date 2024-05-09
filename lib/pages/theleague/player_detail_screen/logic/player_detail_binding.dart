import 'package:get/get.dart';

import 'player_detail_controller.dart';

class PlayerDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerDetailController>(() => PlayerDetailController());
  }
}
