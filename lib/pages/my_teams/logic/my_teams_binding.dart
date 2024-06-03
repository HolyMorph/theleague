import 'package:get/get.dart';
import 'my_teams_logic.dart';

class MyTeamsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTeamsController>(() => MyTeamsController());
  }
}
