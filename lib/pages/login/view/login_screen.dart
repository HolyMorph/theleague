import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../style/my_colors.dart';
import '../../../utils/basic_utils.dart';
import '../../../utils/fa_icon.dart';
import '../../core/logic/core_controller.dart';
import '../../core/suit/core_routes.dart';
import '../../register/suit/register_routes.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Form(
        key: controller.state.formKey,
        child: Column(
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
              customValidation: (value) => BasicUtils().emailValidator(value),
            ),
            const SizedBox(height: 16),
            ObxValue(
              (isObscure) => SettingsTextField(
                title: 'Нууц үг',
                isRequired: true,
                isActive: true,
                textEditingController: controller.state.passwordController,
                hintText: '*************',
                errorText: 'Нууц үг оруулна уу.',
                obscureText: isObscure.value,
                suffix: GestureDetector(
                  onTap: () {
                    isObscure.toggle();
                  },
                  child: Icon(
                    !isObscure.value ? Icons.visibility : Icons.visibility_off,
                    color: MyColors.grey300,
                  ),
                ),
                prefix: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    FaIcon.lock,
                    textAlign: TextAlign.center,
                    style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
                  ),
                ),
              ),
              controller.state.isObscure,
            ),
            const SizedBox(height: 16),
            Obx(
              () {
                return ElevatedButton(
                  onPressed: () async {
                    if (controller.state.formKey.currentState!.validate() && controller.state.passwordController.text.isNotEmpty) {
                      var (isSuccess, response) = await controller.userLogin();
                      if (isSuccess) {
                        FocusScope.of(context).unfocus();
                        Get.until((route) => Get.currentRoute == CoreRoutes.coreScreen);
                        Get.find<CoreController>().getMeData();
                      } else {
                        AlertHelper.showFlashAlert(
                          title: 'Алдаа',
                          message: '${response['message']}',
                          status: FlashStatus.failed,
                        );
                      }
                    }
                  },
                  child: controller.state.isLoading.value ? CupertinoActivityIndicator(color: Colors.white) : Text('Нэвтрэх'),
                );
              },
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
      ),
    );
  }
}
