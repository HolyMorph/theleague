import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_storage.dart';
import '../state/register_state.dart';

class RegisterController extends GetxController {
  final state = RegisterState();

  Future<(bool, dynamic)> userRegister() async {
    state.isLoading.value = true;
    if (state.avatarUrl.isEmpty) await uploadAvatar(file: File(state.selectedImage.value?.path ?? ''));

    dynamic body = {
      'email': state.emailController.text,
      'password': state.passwordController.text,
      'firstName': state.firstNameController.text,
      'lastName': state.lastNameController.text,
      'registrationNumber': state.registerController.text,
      'gender': state.selectedGender.value == 'Эрэгтэй' ? 'male' : 'female',
      'height': int.tryParse(state.heightController.text),
      'weight': int.tryParse(state.weightController.text),
      'avatar': state.avatarUrl.value,
      'phoneNumber': state.phoneNumberController.text,
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
    } else {
      AlertHelper.showFlashAlert(
        title: 'Алдаа',
        message: '${response['message']}',
        status: FlashStatus.failed,
      );
    }
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> uploadAvatar({required File file}) async {
    String? token = await MyStorage.instance.getData(Constants.TOKEN);

    String fileName = file.path.split('/').last;

    Dio.FormData formData = Dio.FormData.fromMap({
      'files': await Dio.MultipartFile.fromFile(file.path, filename: fileName),
    });

    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: '${Constants.BASE_UPLOAD_URL}v2/upload?prefix=client&useFileName=false&folderPath=user-avatar&debug=true',
      method: Method.post,
      body: formData,
      headers: {'Authorization': 'Bearer ${token}'},
    );

    if (isSuccess) {
      state.avatarUrl.value = response['result'][0]['fileUrl'];
    } else {
      AlertHelper.showFlashAlert(title: 'Алдаа', message: '${response['message']}');
    }
    return (isSuccess, response);
  }
}
