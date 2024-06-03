import 'package:get/get.dart';
import '../../all_star_home/logic/all_star_controller.dart';

class VolleyBallAllStarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllStarController>(() => AllStarController());
  }
}
