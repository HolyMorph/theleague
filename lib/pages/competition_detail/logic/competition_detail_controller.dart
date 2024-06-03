import 'package:get/get.dart';

import '../../../service/my_client.dart';
import '../../../utils/basic_utils.dart';
import '../state/competition_detail_state.dart';

class CompetitionDetailController extends GetxController {
  final state = CompetitionDetailState();

  Future<(bool, dynamic)> getGameDetail() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/${state.gameCode.value}',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.gameData.value = response['result'];
      if (state.gameData['registrationRequired'] == true) {
        BasicUtils().notLoggedIn(route: Get.currentRoute, dismissible: false);
      }
    }

    return (isSuccess, response);
  }

  @override
  void onInit() {
    state.gameCode.value = Get.parameters['id']!;
    getGameDetail();

    super.onInit();
  }
}
