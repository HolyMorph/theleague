import 'dart:io';
import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../core/logic/core_controller.dart';
import '../state/settings_state.dart';

class SettingsController extends GetxController {
  final state = SettingsState();

  @override
  void onInit() {
    state.userData.value = Get.find<CoreController>().state.meData;

    super.onInit();
  }

  Future<(bool, dynamic)> changeAvatar() async {
    state.isAvatarLoading.value = true;
    var (success, data) = await Get.find<CoreController>().uploadAvatar(file: File(state.selectedImage.value?.path ?? ''));
    if (success) {
      state.avatarUrl.value = data['result'][0]['fileUrl'];
    } else {
      state.isAvatarLoading.value = false;
      return (false, {});
    }

    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me/update-profile-image',
      method: Method.post,
      body: {
        'avatar': '${state.avatarUrl.value}',
      },
    );

    state.isAvatarLoading.value = false;
    state.selectedImage.value = null;
    state.selectedImage.refresh();

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> changeHeightWeight() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me/update-profile',
      method: Method.post,
      body: {
        if (state.weight.isNotEmpty) 'weight': '${int.tryParse(state.weight.value) ?? 0}',
        if (state.height.isNotEmpty) 'height': '${int.tryParse(state.height.value) ?? 0}',
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.weight.value = '';
      state.height.value = '';
    }
    return (isSuccess, response);
  }
}
