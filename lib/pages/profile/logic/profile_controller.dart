import 'package:get/get.dart';

import '../../../service/my_client.dart';
import '../state/profile_state.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  Future<(bool, dynamic)> getGameList() async {
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me',
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.meData.value = response['result'];
    }

    return (isSuccess, response);
  }

  @override
  void onInit() {
    getGameList();
    super.onInit();
  }
}
