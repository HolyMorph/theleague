import 'package:get/get.dart';

import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../state/judge_state.dart';

class JudgeController extends GetxController {
  final state = JudgeState();

  Future<(bool, dynamic)> getGame({required String gameCode}) async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(urlPath: 'api/game/${gameCode}');
    state.isLoading.value = false;
    if (isSuccess) {
      state.gameData.value = response['result'];
    }
    return (isSuccess, response);
  }

  Future<(bool, dynamic)> checkJudge() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/entry/check-entry',
      method: Method.post,
      body: {'entry_id': '${state.entryData['_id']}'},
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.isChecked.value = true;
    }
    return (isSuccess, response);
  }

  @override
  void onInit() {
    state.gameCode.value = Get.parameters['gameCode'] ?? '';
    state.entryData.value = Get.arguments['entry'] ?? {};
    if (state.gameCode.isNotEmpty) getGame(gameCode: state.gameCode.value);
    super.onInit();
  }
}
