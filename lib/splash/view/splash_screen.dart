import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/my_progress_indicator.dart';
import '../../style/my_colors.dart';
import '../logic/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (SplashController controller) {
        return Obx(() {
          return Scaffold(
            backgroundColor: MyColors.backgroundColor,
            body: controller.state.isLoading.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: MyProgressIndicator(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Уншиж байна, түр хүлээнэ үү.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'GIP',
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Image.asset(
                      'assets/icons/ic_logo.png',
                      height: 209,
                      width: 167,
                    ),
                  ),
          );
        });
      },
    );
  }
}
