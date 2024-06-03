import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/basic_utils.dart';
import '../../../utils/game_type.dart';
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
      if (state.myTeams.isEmpty) {
        BasicUtils().noTeamDialog(from: Get.currentRoute);
      }
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

  Future<(bool, dynamic)> getGameDetail() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/${state.gameId.value}',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.gameData.value = response['result'];
      setGameType(gameType: state.gameData['gameType']);
      if (state.gameType.value == GameType.Team) await getMyTeams();
    }

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> joinGame() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/entry/join-game',
      method: Method.post,
      body: {
        'game_code': '${state.gameData['code']}',
        'team_code': '${state.teamData['team']['code']}',
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      await myEntries();
    }

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> myEntries() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/entry/my-entries',
      method: Method.post,
      body: {'game_code': state.gameData['code']},
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.entryList.value = response['result'];
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

  void setGameType({required String gameType}) {
    switch (gameType) {
      case 'team':
        {
          state.gameType.value = GameType.Team;
        }
      case 'individual':
        {
          state.gameType.value = GameType.Individual;
        }
    }
  }

  @override
  void onInit() async {
    state.gameId.value = Get.parameters['id'] ?? '';
    await getGameDetail();
    super.onInit();
  }
}
