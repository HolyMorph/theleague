import 'package:get/get.dart';

class LoginState {
  RxBool isLoading = RxBool(false);
  RxString otpCode = RxString('');
  RxString password = RxString('');
  RxString phoneNumber = RxString('');
  RxList<dynamic> tempData = RxList();
}
