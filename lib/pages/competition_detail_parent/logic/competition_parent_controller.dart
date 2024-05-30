import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../state/competition_parent_state.dart';

class CompetitionParentController extends GetxController {
  final state = CompetitionParentState();

  @override
  void onInit() {
    state.gameCode.value = Get.parameters['id']!;
    getGameList();
    super.onInit();
  }

  Future<(bool, dynamic)> getGameList() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/list',
      method: Method.post,
      body: {'parentGame': state.gameCode.value},
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.gameData.value = response['result'];
    }

    return (isSuccess, response);
  }
}
