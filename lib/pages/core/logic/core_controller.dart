import 'package:get/get.dart';
import '../../../service/my_client.dart';
import '../state/core_state.dart';

class CoreController extends GetxController {
  final state = CoreState();

  Future<(bool, dynamic)> getMeData() async {
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/me',
    );

    if (isSuccess) {
      state.meData.value = response['result'];
      if (state.meData['type'] == 'athelete' || state.meData['type'] == 'clientuser') {
        state.isActive.value = true;
      } else {
        state.isActive.value = false;
      }
    }

    return (isSuccess, response);
  }
}
