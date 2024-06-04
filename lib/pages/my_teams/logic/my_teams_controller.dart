import 'package:get/get.dart';

import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../state/my_teams_state.dart';

class MyTeamsController extends GetxController {
  final state = MyTeamsState();

  Future<(bool, dynamic)> getMyTeams() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/my-teams',
      method: Method.post,
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.myTeams.value = response['result'];
    } else {
      Get.back();
      AlertHelper.showFlashAlert(
        title: 'Уучлаарай',
        message: response['message'] ?? 'Дахин оролдоно уу',
        status: FlashStatus.failed,
      );
    }

    return (isSuccess, response);
  }

  @override
  void onInit() {
    getMyTeams();
    super.onInit();
  }
}
