import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../route/my_routes.dart';
import '../../../../service/api_client.dart';
import '../state/coach_verify_state.dart';

class CoachVerifyController extends GetxController {
  final state = CoachVerifyState();

  void set coachCode(String coachCode) => state.coachCode.value = coachCode;
  void set isLoading(bool loading) => state.isLoading.value = loading;
  void set teamCode(String teamCode) => state.teamCode.value = teamCode;

  Future<void> checkCoach() async {
    isLoading = true;
    var body = {'login_code': state.coachCode.value};
    dynamic response = await ApiClient().sendRequest('/api/me/connect-coach', method: Method.post, body: body);

    isLoading = false;
    if (MezornClientHelper.isValidResponse(response)) {
      if (response.data['statusCode'] == 400 || response.data['statusCode'] == 404) {
        var message = response.data['message_mn'] ?? response.data['message'] as String;

        AlertHelper.showFlashAlert(
          title: 'Алдаа гарлаа',
          message: message,
          status: FlashStatus.failed,
        );
      } else {
        teamCode = response.data['result']['teamCode'];
        MezornClientHelper().saveToken = response.data['result']['token'];
        MezornClientHelper().refreshToken = response.data['result']['refreshToken'];
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
}
