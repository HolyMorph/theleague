import 'package:get/get.dart';
import 'league_splash_controller.dart';

class LeagueSplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeagueSplashController>(() => LeagueSplashController());
  }
}
