import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/my_colors.dart';
import '../logic/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        return Scaffold(
          backgroundColor: MyColors.backgroundColor,
          body: Center(
            child: Image.asset(
              'assets/icons/ic_logo.png',
              height: 209,
              width: 167,
            ),
          ),
        );
      },
    );
  }
}
