import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/login_controller.dart';
import '../suit/login_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (LoginController controller) => Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Миний бүртгэл',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight - 20),
            child: const SizedBox(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Нэвтрэх',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: MyColors.neutral900,
              ),
            ),
            const SizedBox(height: 16),
            SettingsTextField(
              title: 'Цахим хаяг',
              prefix: Text(
                FaIcon.email,
                style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
              ).paddingOnly(right: 8),
              initialValue: 'baddoggy_saagii@gmail.com',
              isActive: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(LoginRoutes.verifyScreen);
              },
              child: Text(
                'Нэвтрэх',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
