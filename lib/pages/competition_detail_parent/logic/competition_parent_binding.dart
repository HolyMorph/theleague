import 'package:get/get.dart';
import 'competition_parent_controller.dart';

class CompetitionParentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompetitionParentController>(() => CompetitionParentController());
  }
}
