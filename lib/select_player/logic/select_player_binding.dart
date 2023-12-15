import 'package:get/get.dart';
import 'select_player_controller.dart';

class SelectPlayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectPlayerController>(() => SelectPlayerController());
  }
}
