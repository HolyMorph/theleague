import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_common/mezorn_common.dart';

import '../logic/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Утасны дугаар',
              ),
              onChanged: (text) {
                controller.phoneNumber = text;
              },
            ),
            SizedBox(height: 12),
            Obx(() {
              bool _isValidPhoneNumber = MezornCommon.isValidPhoneNumber(controller.phoneNumber);

              return ElevatedButton(
                onPressed: _isValidPhoneNumber
                    ? () async {
                        await controller.getOtp();
                        Get.toNamed('/verify');
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
