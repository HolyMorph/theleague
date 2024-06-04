import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/my_client.dart';
import '../state/edit_team_state.dart';

class EditTeamController extends GetxController {
  final state = EditTeamState();

  Future<(bool, dynamic)> getTeamDetail() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/${state.teamCode.value}',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.myTeam.value = response['result'];
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

  Future<(bool, dynamic)> searchMember({String? code}) async {
    state.isSearching.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/clientuser/${code ?? state.searchEditingController.text.toUpperCase()}',
    );
    state.isSearching.value = false;
    return (isSuccess, response);
  }

  @override
  void onInit() {
    state.teamCode.value = Get.parameters['code'] ?? '';
    state.from.value = Get.parameters['from'] ?? '';

    getTeamDetail();
    super.onInit();
  }
}
