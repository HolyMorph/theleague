import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../style/my_colors.dart';
import '../../../utils/basic_utils.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_storage.dart';
import '../state/core_state.dart';

class CoreController extends GetxController {
  final state = CoreState();

  Future<(bool, dynamic)> getMeData() async {
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me/',
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
      AlertHelper.showFlashAlert(
        title: 'Алдаа',
        message: response['message'] ?? 'Хүсэлт амжилтгүй',
        status: FlashStatus.failed,
      );
    }
    return (isSuccess, response);
  }

  void _showForceUpdateDialog() {
    Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Анхааруулга',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sport Lab-н шинэ хувилбар гарсан байна та апп-аа шинэчилнэ үү. Баярлалаа',
                style: const TextStyle(color: MyColors.grey500),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  BasicUtils.openUrl(url: GetPlatform.isAndroid ? Constants().PlayStoreUrl : Constants().AppStoreUrl);
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text(
                  'Шинэчлэх',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
