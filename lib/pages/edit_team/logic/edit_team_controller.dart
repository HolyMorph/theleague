import 'dart:io';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../core/logic/core_controller.dart';
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
      state.isMeOwner.value = state.myTeam['team']['owner_code'] == Get.find<CoreController>().state.meData['code'];
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

  Future<(bool, dynamic)> addMember({String? code}) async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/add-member',
      body: {'team_code': state.myTeam['team']['code'], 'member_code': code},
      method: Method.post,
    );
    state.isLoading.value = false;
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> removeMember({String? code}) async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/leave-team',
      body: {'team_code': state.myTeam['team']['code'], 'leaving_member_code': code},
      method: Method.post,
    );
    state.isLoading.value = false;
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> deleteTeam() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/delete-team',
      body: {'team_code': state.myTeam['team']['code']},
      method: Method.post,
    );
    state.isLoading.value = false;
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> leaveTeam() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/leave-team',
      body: {'team_code': state.myTeam['team']['code']},
      method: Method.post,
    );
    state.isLoading.value = false;
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> updateTeam() async {
    state.isLoading.value = true;

    if (state.selectedImage.value != null) {
      var (isSuccess, response) = await Get.find<CoreController>().uploadAvatar(file: File(state.selectedImage.value?.path ?? ''));
      if (isSuccess) {
        state.newLogoUrl.value = response['result'][0]['fileUrl'];
        state.selectedImage.value = null;
      } else {
        state.isLoading.value = false;
        return (false, {});
      }
    }

    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/${state.myTeam['team']['code']}',
      body: {
        if (state.newTeamName.value.isNotEmpty) 'name': state.newTeamName.value,
        if (state.newLogoUrl.value.isNotEmpty) 'logoUrl': state.newLogoUrl.value,
      },
      method: Method.post,
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.selectedImage.value = null;
      state.newTeamName.value = '';
      state.newLogoUrl.value = '';
    }
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
