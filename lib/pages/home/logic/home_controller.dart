import 'package:get/get.dart';
import '../../../service/method.dart';
import '../../../service/my_client.dart';
import '../state/home_state.dart';

class HomeController extends FullLifeCycleController with FullLifeCycleMixin {
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

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() async {
    state.isLoading.value = true;
    await getHomeData();
    state.isLoading.value = false;
  }
}
