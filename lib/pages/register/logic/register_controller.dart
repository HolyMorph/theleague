import 'dart:io';
import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_storage.dart';
import '../../core/logic/core_controller.dart';
import '../state/register_state.dart';

class RegisterController extends GetxController {
  final state = RegisterState();

  Future<(bool, dynamic)> athleteRegister() async {
    state.isLoading.value = true;
    if (state.avatarUrl.isEmpty) {
      var (isSuccess, response) = await Get.find<CoreController>().uploadAvatar(file: File(state.selectedImage.value?.path ?? ''));
      if (isSuccess) {
        state.avatarUrl.value = response['result'][0]['fileUrl'];
      } else {
        state.isLoading.value = false;
        return (false, {});
      }
    }

    dynamic body = {
      if (Get.find<CoreController>().state.meData['type'] == 'appuser') 'email': state.emailController.text,
      if (Get.find<CoreController>().state.meData['type'] == 'appuser') 'password': state.passwordController.text,
      'firstName': state.firstNameController.text,
      'lastName': state.lastNameController.text,
      'registrationNumber': state.registerController.text,
      'gender': state.selectedGender.value == 'Эрэгтэй' ? 'male' : 'female',
      'height': int.tryParse(state.heightController.text),
      'weight': int.tryParse(state.weightController.text),
      'avatar': state.avatarUrl.value,
      if (state.phoneNumberController.text.isNotEmpty) 'phoneNumber': state.phoneNumberController.text,
    };

    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/auth/register-all',
      method: Method.post,
      body: body,
    );
    state.isLoading.value = false;
    if (isSuccess) {
      MyStorage.instance.saveData(Constants.TOKEN, response['result']['token']);
      MyStorage.instance.saveData(Constants.USERTYPE, response['result']['type']);
    }
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> clientRegister() async {
    state.isLoading.value = true;

    dynamic body = {
      'name': state.clientNameController.text,
      'email': state.emailController.text,
      'password': state.passwordController.text,
    };

    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/auth/register-client',
      method: Method.post,
      body: body,
    );
    state.isLoading.value = false;
    if (isSuccess) {
      MyStorage.instance.saveData(Constants.TOKEN, response['result']['token']);
      MyStorage.instance.saveData(Constants.USERTYPE, response['result']['type']);
    }
    return (isSuccess, response);
  }

  @override
  void onInit() {
    state.from.value = Get.parameters['from'] ?? '';
    super.onInit();
  }
}
