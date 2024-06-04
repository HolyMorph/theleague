import 'package:get/get.dart';

import 'edit_team_controller.dart';

class EditTeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTeamController>(() => EditTeamController());
  }
}
