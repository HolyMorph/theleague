import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello. I`m splash Screen'),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: Text('Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
