import 'package:get/get.dart';

import '../../../utils/my_storage.dart';
import '../state/onboarding_state.dart';

class OnboardingController extends GetxController {
  final state = OnboardingState();

  @override
  void onInit() async {
    state.coachData.value = await MyStorage.instance.getData('coachData');
    super.onInit();
  }
}
