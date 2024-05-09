import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../route/my_routes.dart';
import '../logic/splash_controller.dart';

class ReloadScreen extends GetView<SplashController> {
  const ReloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async {
            Get.offNamed(MyRoutes.splash);
            await controller.checkUserToken();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icons/ic_reload.png', scale: 2),
              const SizedBox(height: 12),
              Text(
                'Алдаа гарлаа, та дахин уншуулна уу.',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'GIP',
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
