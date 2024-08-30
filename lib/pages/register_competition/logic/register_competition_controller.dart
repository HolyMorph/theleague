import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../../utils/basic_utils.dart';
import '../../../utils/game_type.dart';
import '../../core/logic/core_controller.dart';
import '../../core/suit/core_routes.dart';
import '../../create_team/suit/create_team_routes.dart';
import '../state/register_competition_state.dart';
import '../suit/register_competition_routes.dart';

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
        BasicUtils().noTeamDialog(
          onTap: () {
            Get.back();
            Get.toNamed(CreateTeamRoutes.createTeamScreen, parameters: {'from': Get.currentRoute})?.then((value) => getMyTeams());
          },
        );
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

  Future<(bool, dynamic)> checkInvoice() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: 'api/pmnt/check-payment',
      method: Method.post,
      body: {
        'gameCode': '${state.entityDetail['game_code']}',
        'entryCode': '${state.entityDetail['entryCode']}',
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      if (response['result']['entryStatus'] == 'ready' || response['result']['entryStatus'] == 'owner-ready') {
        if (state.from.value.isNotEmpty) {
          Get.until((route) => Get.currentRoute == '${state.from.value}');
        } else {
          Get.until((route) => Get.currentRoute == CoreRoutes.coreScreen);
        }
        AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Төлбөр амжилттай хийгдлээ');
      }
    } else {
      AlertHelper.showFlashAlert(title: 'Уучлаарай', message: response['message'] ?? 'Хүсэлт амжилтгүй');
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
      if (state.gameType.value == GameType.Individual) {
        var (isSuccess, response) = await myEntries();
        if (!isSuccess) {
          AlertHelper.showFlashAlert(
            title: 'Алдаа',
            message: response['message'] ?? 'Хүсэлт амжилтгүй',
            status: FlashStatus.failed,
          );
        }
      }

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
        if (state.gameData['gameType'] == 'team') 'team_code': '${state.teamData['team']['code']}',
      },
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.entityDetail.value = response['result'];
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
      state.entryList.value = response['result']['entries'] ?? [];
      dynamic entry;
      if (state.gameType.value == GameType.Team)
        entry = state.entryList.firstWhereOrNull((entry) => entry['teamCode'] == state.teamData['team']['code']) ?? {};

      if (state.gameType.value == GameType.Individual)
        entry = state.entryList.firstWhereOrNull((entry) => entry['code'] == Get.find<CoreController>().state.meData['code']) ?? {};

      if (entry.isEmpty) {
        var (isSuccess, response) = await joinGame();
        if (isSuccess) {
          if (state.gameType.value == GameType.Team) Get.toNamed(RegisterCompetitionRoutes.registerCompetitionConfirmation);
          if (state.gameType.value == GameType.Individual) Get.toNamed(RegisterCompetitionRoutes.registerCompetitionConfirmation);
        } else {
          if (state.gameType.value == GameType.Individual) Get.back();
          AlertHelper.showFlashAlert(
            title: 'Уучлаарай',
            message: response['message'] ?? 'Хүсэлт амжилтгүй',
            status: FlashStatus.failed,
          );
        }
      } else {
        state.entityDetail.value = entry;
        if (state.gameType.value == GameType.Team) Get.toNamed(RegisterCompetitionRoutes.registerCompetitionConfirmation);
        if (state.gameType.value == GameType.Individual) Get.toNamed(RegisterCompetitionRoutes.registerCompetitionConfirmation);
      }
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
    state.from.value = Get.parameters['from'] ?? '';
    getGameDetail();
    super.onInit();
  }
}
