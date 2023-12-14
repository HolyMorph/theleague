import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../alert/alert_helper.dart';
import '../../route/my_routes.dart';
import '../../utils/constants.dart';
import '../../utils/my_timer.dart';
import '../logic/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  final MyTimer _splashTimer = MyTimer();

  @override
  StatelessElement createElement() {
    _splashTimer.delayed(
      onFinished: _showNextScreen,
      duration: Duration(milliseconds: Constants.splashDelayMillis),
    );

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Demo UI'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _splashTimer.cancel();
                Get.toNamed(MyRoutes.demoScreen);
              },
              child: Text('Style guide'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                _splashTimer.cancel();
                AlertHelper.showAlert(title: 'I`m title', message: 'I`m dialog message');
              },
              child: Text('Show dialog'),
            ),
          ],
        ),
      ),
    );
  }

  void _showNextScreen() {
    // bool _isLogged = MezornClientHelper().token.isNotEmpty;
    Get.offAndToNamed(MyRoutes.home);
  }
}
