import 'dart:async';

import 'package:get/get.dart';

import '../state/login_state.dart';

class LoginController extends GetxController {
  final state = LoginState();

  ///OTP Resend хийх цаг гүйлгэж эхлэх
  void startResendTimer() {
    state.resendActivated.value = false;

    const duration = Duration(seconds: 1);
    if (state.resendTimer != null) {
      state.resendTimer?.cancel();
    }
    state.resendTimer = Timer.periodic(duration, (timer) {
      if (state.resendDuration.value == 0) {
        state.resendActivated.value = true;
        timer.cancel();
      } else {
        state.resendDuration--;
      }
    });
  }

  @override
  void onClose() {
    state.resendTimer?.cancel();
    super.onClose();
  }
}
