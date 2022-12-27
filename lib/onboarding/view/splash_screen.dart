import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_api_caller/api/mezorn_client_helper.dart';

import '../../alert/alert_helper.dart';
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
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: Text('Login Screen'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                MezornClientHelper().token = 'sd';
                // LocalStorage.saveData('temp', 'sdaadad');
              },
              child: Text('Save local data'),
            ),
            SizedBox(height: 12),
            Text(MezornClientHelper().token),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/demo');
              },
              child: Text('Go to demo screen'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                AlertHelper.showAlert(title: 'I`m title', message: 'I`m dialog message');
              },
              child: Text('Show dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
