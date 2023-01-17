import 'package:get/get.dart';
import 'package:mezorn_api_caller/api_caller.dart';

import '../../service/api_client.dart';
import '../../service/base_response.dart';
import '../state/login_state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();

  void set otpCode(String phoneNumber) => state.otpCode.value = phoneNumber;

  void set phoneNumber(String phoneNumber) => state.phoneNumber.value = phoneNumber;

  ///Нэвтрэх сервис
  Future<BaseResponse> getOtp() async {
    dynamic _response = await ApiClient.sendRequest(
      'getOtp',
      method: Method.post,
      body: {
        'phoneNumber': state.phoneNumber.value,
      },
    );

    return BaseResponse(
      response: _response,
      success: MezornClientHelper.isValidResponse(_response),
    );
  }

  ///Нэвтрэх сервис
  Future<BaseResponse> verify() async {
    dynamic _response = ApiClient.sendRequest(
      'verify',
      method: Method.post,
      body: {
        'phoneNumber': state.phoneNumber.value,
        'otp': state.otpCode.value,
      },
    );

    return BaseResponse(
      response: _response,
      success: MezornClientHelper.isValidResponse(_response),
    );
  }
}
