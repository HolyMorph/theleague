import 'dart:async';
import 'package:get/get.dart';

class LoginState {
  final RxBool isLoading = RxBool(false);

  RxBool actionButtonValid = RxBool(false);
  RxString from = RxString('');
  RxBool isValidPhoneNumber = RxBool(true);

  RxString otpCode = RxString('');
  RxDouble otpWidth = RxDouble(51);
  RxString phoneNumber = RxString('');
  RxString phoneNumberErrorText = RxString('');
  RxBool resendActivated = RxBool(false);
  RxInt resendDuration = RxInt(120);
  Timer? resendTimer;

  RxString email = RxString('');
  RxString password = RxString('');
  RxBool rememberMe = RxBool(false);
}
