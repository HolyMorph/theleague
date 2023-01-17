import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../alert/alert_helper.dart';
import '../../service/base_response.dart';
import '../logic/login_controller.dart';
import '../state/login_state.dart';

class VerifyScreen extends GetView<LoginController> {
  const VerifyScreen() : super();

  @override
  Widget build(BuildContext context) {
    LoginState state = controller.state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.phoneNumber.value),
            SizedBox(height: 12),
            TextFormField(
              key: Key('otpInput'),
              decoration: InputDecoration(
                hintText: 'Баталгаажуулах код',
              ),
              onChanged: (text) {
                controller.otpCode = text;
              },
            ),
            SizedBox(height: 12),
            Obx(() {
              bool _isActive = state.otpCode.isNotEmpty && state.phoneNumber.isNotEmpty;

              return ElevatedButton(
                key: Key('verifyButton'),
                onPressed: _isActive
                    ? () async {
                        BaseResponse _response = await controller.verify();
                        if (_response.success) {
                          Get.toNamed('/home');
                        } else {
                          AlertHelper.showAlert(response: _response.response);
                        }
                      }
                    : null,
                child: Text('Баталгаажуулах'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
