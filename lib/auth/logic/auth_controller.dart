import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api_caller.dart';

import '../../service/api_client.dart';
import '../state/auth_state.dart';

class AuthController extends GetxController {
  final AuthState _authState = AuthState();

  String get otpCode => _authState.otpCode.value;
  void set otpCode(String phoneNumber) => _authState.otpCode.value = phoneNumber;

  ///Утасны дугаар авах болон утга өгөх хийх функц
  String get phoneNumber => _authState.phoneNumber.value;
  void set phoneNumber(String phoneNumber) => _authState.phoneNumber.value = phoneNumber;

  ///Нэвтрэх сервис
  Future<bool> getOtp() async {
    dynamic _response = await ApiClient().sendRequest(
      'getOtp',
      method: Method.post,
      body: {'phoneNumber': phoneNumber},
    );
    debugPrint('response = $_response');

    return true;
  }

  ///Нэвтрэх сервис
  Future<bool> verify() async {
    dynamic _response = ApiClient().sendRequest(
      'verify',
      method: Method.post,
      body: {'phoneNumber': phoneNumber, 'otp': otpCode},
    );
    debugPrint('response = $_response');

    return true;
  }
}
