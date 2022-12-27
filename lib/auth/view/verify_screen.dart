import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/auth_controller.dart';

class VerifyScreen extends GetView<AuthController> {
  const VerifyScreen() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.phoneNumber),
            SizedBox(height: 12),
            TextFormField(
              onChanged: (text) {
                controller.otpCode = text;
              },
            ),
            SizedBox(height: 12),
            Obx(() {
              bool _isActive = controller.otpCode.isNotEmpty && controller.phoneNumber.isNotEmpty;

              return ElevatedButton(
                onPressed: _isActive
                    ? () async {
                        await controller.verify();
                        Get.toNamed('/home');
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
