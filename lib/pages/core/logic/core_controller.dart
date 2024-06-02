import 'dart:io';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_storage.dart';
import '../state/core_state.dart';

class CoreController extends GetxController {
  final state = CoreState();

  Future<(bool, dynamic)> getMeData() async {
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me',
    );

    if (isSuccess) {
      state.meData.value = response['result'];
      if (state.meData['type'] == 'athelete' || state.meData['type'] == 'clientuser') {
        state.isLoggedIn.value = true;
      } else {
        state.isLoggedIn.value = false;
      }
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

    if (!isSuccess) {
      AlertHelper.showFlashAlert(title: 'Алдаа', message: '${response['message']}');
    }
    return (isSuccess, response);
  }
}
