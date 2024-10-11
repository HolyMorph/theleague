import 'dart:async';
import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_storage.dart';
import '../state/login_state.dart';

class LoginController extends GetxController {
  final state = LoginState();

  Future<(bool, dynamic)> userLogin() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/auth/login',
      method: Method.post,
      body: {
        'email': state.emailController.text.toLowerCase(),
        'password': state.passwordController.text,
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      MyStorage.instance.saveData(Constants.TOKEN, response['result']['token']);
      MyStorage.instance.saveData(Constants.USERTYPE, response['result']['type']);
    }
    return (isSuccess, response);
  }

  @override
  void onClose() {
    state.resendTimer?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    state.from.value = Get.parameters['from'] ?? '';
    super.onInit();
  }
}
