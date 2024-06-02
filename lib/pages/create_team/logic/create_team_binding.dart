import 'package:get/get.dart';

import 'create_team_controller.dart';

class CreateTeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTeamController>(() => CreateTeamController());
  }
}
