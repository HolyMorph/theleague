import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  final RxBool isLoading = RxBool(false);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool actionButtonValid = RxBool(false);
  RxString from = RxString('');
  RxBool isValidPhoneNumber = RxBool(true);

  RxString phoneNumber = RxString('');
  RxString phoneNumberErrorText = RxString('');
  RxBool resendActivated = RxBool(false);
  RxInt resendDuration = RxInt(120);
  Timer? resendTimer;

  RxString email = RxString('');
  RxString password = RxString('');
  RxBool rememberMe = RxBool(false);
}
