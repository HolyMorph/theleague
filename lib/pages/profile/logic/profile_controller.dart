import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../core/logic/core_controller.dart';
import '../state/profile_state.dart';

class ProfileController extends GetxController {
  final state = ProfileState();
  final CoreController coreController = Get.find();

  Future<(bool, dynamic)> readQr({required String code}) async {
    state.checkerLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me/read-qr',
      method: Method.post,
      body: {'qr': code},
    );
    state.checkerLoading.value = false;
    if (!isSuccess) {
      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: response['message'] ?? 'Өгөгдөл олдсонгүй',
        status: FlashStatus.failed,
      );
    }
    return (isSuccess, response);
  }
}
