import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../state/home_state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  Future<(bool, dynamic)> getHomeData() async {
    if (state.homeData.isEmpty) state.isLoading.value = true;
    var (isSuccess, response) = await MyClient.instance.sendHttpRequest(
      urlPath: 'api/game/list',
      method: Method.post,
    );
    state.isLoading.value = false;
    if (isSuccess) {
      state.homeData.value = response['result'];
      state.filteredList.value = response['result']['docs'];
    }

    return (isSuccess, response);
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
