import 'package:get/get.dart';
import '../../../../route/my_routes.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../state/league_splash_state.dart';

class LeagueSplashController extends GetxController {
  final state = LeagueSplashState();

  @override
  void onInit() {
    state.gameCode.value = Get.parameters['gameCode'] ?? '';
    state.category.value = Get.parameters['category'] ?? '';
    state.gender.value = Get.parameters['gender'] ?? '';
    _getMetaData();
    super.onInit();
  }

  Future<void> _getMetaData() async {
    await Future.delayed(2.seconds);
    state.isLoading.value = true;
    var (isSuccess, response) = await MyClient().sendHttpRequest(
      urlPath: '/api/vote/me',
      queryParameters: {'category': state.category.value, 'gameCode': state.gameCode.value},
    );

    if (isSuccess) {
      await MyStorage().saveData(Constants.META_DATA, response['result']['meta']);
      await MyStorage().saveData(Constants.TIMESTAMP, response['result']['meta']['timestamp']);

      dynamic teams = response['result']['meta']['teams'];
      dynamic players = response['result']['meta']['players'];
      List<dynamic> metaData = [];

      for (var index = 0; index < teams.length; index++) {
        teams[index]..['players'] = [];
        metaData.add(teams[index]);

        for (var playerIndex = 0; playerIndex < players.length; playerIndex++) {
          if (teams[index]['code'].toLowerCase() == players[playerIndex]['teamCode'].toLowerCase()) {
            metaData[index]['players'].add(players[playerIndex]);
          }
        }
      }

      await MyStorage().saveData(Constants.TEAMS, metaData);
      await Future.delayed(2.seconds);
      state.isLoading.value = false;
      Get.offNamed(MyRoutes.voteResult + '/${state.category.value}/${state.gameCode.value}/${state.gender.value}');
    } else {
      state.isLoading.value = false;
      Get.toNamed(MyRoutes.reloadScreen);
    }
  }
}
