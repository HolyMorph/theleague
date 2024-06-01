import 'package:get/get.dart';
import '../../core/logic/core_controller.dart';
import '../state/profile_state.dart';

class ProfileController extends GetxController {
  final state = ProfileState();
  final CoreController coreController = Get.find();
}
