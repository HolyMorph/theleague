import 'package:get/get.dart';

import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../state/register_competition_state.dart';

class RegisterCompetitionController extends GetxController {
  final state = RegisterCompetitionState();

  Future<(bool, dynamic)> getMyTeams() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/my-teams',
      method: Method.post,
      body: {
        'sportCategory': '${state.gameData['gameCategories']}',
        if (state.gameData['gender'] != 'mixed') 'gender': '${state.gameData['gender']}',
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.myTeams.value = response['result']['docs'];
    }

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> getGameDetail() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/${state.gameId.value}',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.gameData.value = response['result'];
    }

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> getTeamDetail({required String teamCode}) async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/team/${teamCode}',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.teamData.value = response['result'];
    }

    return (isSuccess, response);
  }

  @override
  void onInit() async {
    state.gameId.value = Get.parameters['id'] ?? '';
    await getGameDetail();
    getMyTeams();
    super.onInit();
  }
}
