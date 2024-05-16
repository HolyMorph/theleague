import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../route/my_routes.dart';
import '../../../../service/method.dart';
import '../../../../service/my_client.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../state/coach_verify_state.dart';

class CoachVerifyController extends GetxController {
  final state = CoachVerifyState();

  void set coachCode(String coachCode) => state.coachCode.value = coachCode;
  void set isLoading(bool loading) => state.isLoading.value = loading;
  void set teamCode(String teamCode) => state.teamCode.value = teamCode;

  Future<void> checkCoach() async {
    isLoading = true;
    var body = {'login_code': state.coachCode.value};
    var (isSuccess, response) = await MyClient().sendHttpRequest(urlPath: '/api/me/connect-coach', method: Method.post, body: body);

    isLoading = false;
    if (isSuccess) {
      if (response.data['statusCode'] == 400 || response.data['statusCode'] == 404) {
        var message = response.data['message_mn'] ?? response.data['message'] as String;

        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: message,
          status: FlashStatus.failed,
        );
      } else {
        teamCode = response.data['result']['teamCode'];
        MyStorage.instance.saveData(Constants.TOKEN, response.data['result']['token']);
        MyStorage.instance.saveData(Constants.REFRESH_TOKEN, response.data['result']['refreshToken']);

        Get.toNamed(MyRoutes.coachLoadingScreen);
      }
    } else {
      var message = response.data['message'] ?? response.data['error']['message_mn'] as String;

      AlertHelper.showFlashAlert(
        title: 'Алдаа гарлаа',
        message: message,
        status: FlashStatus.failed,
      );
    }
  }

  @override
  void onInit() async {
    state.teams.value = await MyStorage().getData(Constants.TEAMS);
    super.onInit();
  }
}
