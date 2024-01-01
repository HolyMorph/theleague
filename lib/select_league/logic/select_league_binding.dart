import 'package:get/get.dart';

import 'select_league_controller.dart';

class SelectLeagueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLeagueController>(() => SelectLeagueController());
  }
}
