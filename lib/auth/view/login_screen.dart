import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_common/mezorn_common.dart';

import '../../alert/alert_helper.dart';
import '../../service/base_response.dart';
import '../logic/login_controller.dart';
import '../state/login_state.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginState state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Нэвтрэх'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              key: Key('loginInput'),
              decoration: InputDecoration(
                hintText: 'Утасны дугаар',
              ),
              initialValue: state.phoneNumber.value,
              onChanged: (text) {
                controller.phoneNumber = text;
              },
            ),
            SizedBox(height: 12),
            Obx(() {
              bool _isValidPhoneNumber = MezornCommon.isValidPhoneNumber(state.phoneNumber.value);

              return ElevatedButton(
                key: Key('loginButton'),
                onPressed: _isValidPhoneNumber
                    ? () async {
                        BaseResponse _response = await controller.getOtp();
                        if (_response.success) {
                          Get.toNamed('/verify');
                        } else {
                          AlertHelper.showAlert(response: _response.response);
                        }
                      }
                    : null,
                child: Text('Үргэлжлүүлэх'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
