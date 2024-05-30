import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../register/suit/register_routes.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: MyColors.grey900,
            ),
          ),
          const SizedBox(height: 16),
          SettingsTextField(
            title: 'Цахим хаяг',
            isRequired: true,
            isActive: true,
            textEditingController: controller.state.emailController,
            hintText: 'sportlab@email.com',
            prefix: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                FaIcon.email,
                textAlign: TextAlign.center,
                style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SettingsTextField(
            title: 'Нууц үг',
            isRequired: true,
            isActive: true,
            textEditingController: controller.state.passwordController,
            hintText: '*************',
            prefix: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                FaIcon.lock,
                textAlign: TextAlign.center,
                style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => ElevatedButton(
              onPressed: () {
                controller.userLogin();
              },
              child: controller.state.isLoading.value ? CupertinoActivityIndicator(color: Colors.white) : Text('Нэвтрэх'),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
              Get.toNamed(RegisterRoutes.registerEmailScreen);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Бүртгэл байхгүй юу?',
                  style: TextStyle(fontSize: 14, color: MyColors.grey600),
                ),
                const SizedBox(width: 4),
                Text(
                  'Бүртгүүлэх',
                  style: TextStyle(
                    fontSize: 14,
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(16),
    );
  }
}
