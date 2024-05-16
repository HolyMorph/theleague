import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main_screen/view/main_screen.dart';
import '../../register/view/register_screen.dart';
import '../../splash/view/splash_screen.dart';
import '../logic/core_controller.dart';
import '../suit/core_type.dart';

class CoreScreen extends GetView<CoreController> {
  const CoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ObxValue(
        (status) {
          switch (status.value) {
            case CoreType.splash:
              return const SplashScreen();
            case CoreType.home:
              return const MainScreen();
            case CoreType.register:
              return const RegisterScreen();
          }
        },
        controller.state.coreType,
      ),
    );
  }
}
