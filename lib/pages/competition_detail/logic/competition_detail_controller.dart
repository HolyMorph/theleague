import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../../core/logic/core_controller.dart';
import '../state/competition_detail_state.dart';

class CompetitionDetailController extends GetxController {
  final state = CompetitionDetailState();
  final coreController = Get.find<CoreController>();

  Future<(bool, dynamic)> getGameDetail() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/${state.gameCode.value}',
    );

    state.isLoading.value = false;
    if (isSuccess) {
      state.gameData.value = response['result'];

      if (state.gameData['entries'] != null) {
        state.mandates.clear();
        for (var entry in state.gameData['entries']) {
          if (entry['entryStatus'] == 'ready' ||
              entry['entryStatus'] == 'owner-ready' ||
              entry['entryStatus'] == 'checked' ||
              entry['entryStatus'] == 'owner-checked') {
            state.mandates.add(entry);
          }
        }
      }

      if (state.gameData['managerIds'] != null && state.gameData['managerIds'].isNotEmpty) {
        String judge =
            List<String>.from(state.gameData['managerIds']).firstWhereOrNull((judge) => judge == coreController.state.meData['code']) ?? '';
        if (judge.isNotEmpty) state.isMeJudge.value = true;
      }

      state.isRegistered.value = (state.mandates.isNotEmpty) ? true : false;
    }

    return (isSuccess, response);
  }

  Future<(bool, dynamic)> checkJudge({required String code}) async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/entry/read-entry',
      method: Method.post,
      body: {'entry_id': '${code}'},
    );
    state.isLoading.value = false;
    return (isSuccess, response);
  }

  @override
  void onInit() {
    state.gameCode.value = Get.parameters['id']!;
    getGameDetail();

    super.onInit();
  }
}
