import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../style/my_colors.dart';
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
            backgroundColor: MyColors.scaffoldBackgroundColor,
            body: controller.state.isLoading.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearPercentIndicator(
                            percent: 1,
                            lineHeight: 10,
                            animation: true,
                            animationDuration: 2000,
                            fillColor: Colors.white,
                            backgroundColor: MyColors.backgroundColor,
                            progressColor: MyColors.secondaryColor,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Уншиж байна, түр хүлээнэ үү.',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                : Center(
                    child: Image.asset('assets/images/ic_logo_bg.png', scale: 4),
                  ),
          );
        });
      },
    );
  }
}
