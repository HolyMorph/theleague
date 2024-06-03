import 'dart:io';
import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../core/logic/core_controller.dart';
import '../state/create_team_state.dart';

class CreateTeamController extends GetxController {
  final state = CreateTeamState();

  Future<(bool, dynamic)> getGameTypes() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/game-types',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.sportTypes.value = response['result'];
    }

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> createTeam() async {
    state.isLoading.value = true;
    if (state.logoUrl.isEmpty) {
      var (isSuccess, response) = await Get.find<CoreController>().uploadAvatar(file: File(state.selectedImage.value?.path ?? ''));
      if (isSuccess) {
        state.logoUrl.value = response['result'][0]['fileUrl'];
      }
    }

    List<String> members = state.teamMembers.map((entry) => entry['code'].toString()).toList();
    dynamic body = {
      'gender': state.selectedGender.value == 'Эрэгтэй' ? 'male' : 'female',
      'sportCategory': state.selectedType.value,
      'name': state.teamName.value,
      'logoUrl': state.logoUrl.value,
      'members': members,
    };

    state.isLoading.value = false;

    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team',
      method: Method.post,
      body: body,
    );

    if (isSuccess) {}

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> getMyTeams() async {
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/my-teams',
      method: Method.post,
    );

    if (isSuccess) {}

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> searchMember({String? code}) async {
    state.isSearching.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/clientuser/${code ?? state.textEditingController.text.toUpperCase()}',
    );
    state.isSearching.value = false;
    return (isSuccess, response);
  }

  @override
  void onInit() {
    state.from.value = Get.parameters['from'] ?? '';
    getGameTypes();
    state.teamMembers.add(Get.find<CoreController>().state.meData);
    super.onInit();
  }
}
