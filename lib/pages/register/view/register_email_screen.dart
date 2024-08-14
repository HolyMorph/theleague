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
import '../../login/suit/login_routes.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/register_controller.dart';
import '../suit/register_routes.dart';

class RegisterEmailScreen extends GetView<RegisterController> {
  RegisterEmailScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final RxBool isObscure = RxBool(true);

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
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 36,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Бүртгэл үүсгэх',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: MyColors.grey900,
                  ),
                ),
              ],
            ),
            if (controller.state.registerType == 'client') const SizedBox(height: 16),
            if (controller.state.registerType == 'client')
              SettingsTextField(
                title: 'Нэр',
                isRequired: true,
                isActive: true,
                textEditingController: controller.state.clientNameController,
                hintText: 'Таны нэр',
                errorText: 'Нэр оруулна уу',
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
                errorText: '',
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
                onChanged: (input) => controller.state.passwordValid.value = input.length > 7 ? true : false,
                customValidation: (value) {
                  if (value.isEmpty) {
                    return 'Нууц үг оруулна уу.';
                  } else if (value.length < 8) {
                    return 'Нууц үг хамгийн багадаа 8 тэмдэгт байна';
                  }
                  return null;
                },
              ),
              isObscure,
            ),
            const SizedBox(height: 16),
            ObxValue(
              (validPassword) => Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: validPassword.value ? MyColors.primaryColor : MyColors.grey300,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Нууц үг хамгийн багадаа 8 тэмдэгт байна',
                    style: TextStyle(fontSize: 14, color: MyColors.grey600),
                  ),
                ],
              ),
              controller.state.passwordValid,
            ),
            const SizedBox(height: 32),
            ObxValue(
              (loading) => ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (controller.state.registerType.value == 'client') {
                      var (isSuccess, response) = await controller.clientRegister();
                      if (isSuccess) {
                        FocusScope.of(context).unfocus();
                        await Get.find<CoreController>().getMeData();
                        Get.until(
                          (route) => Get.currentRoute == (controller.state.from.isNotEmpty ? controller.state.from.value : CoreRoutes.coreScreen),
                        );
                        AlertHelper.showFlashAlert(
                          title: 'Амжилттай',
                          message: 'Бүртгэл амжилттай үүслээ.',
                        );
                      } else {
                        AlertHelper.showFlashAlert(
                          title: 'Алдаа',
                          message: '${response['message']}',
                          status: FlashStatus.failed,
                        );
                      }
                    } else {
                      Get.toNamed(RegisterRoutes.registerScreen);
                    }
                  }
                },
                child: loading.value ? CupertinoActivityIndicator(color: Colors.white) : Text('Бүртгүүлэх'),
              ),
              controller.state.isLoading,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Get.toNamed(LoginRoutes.loginScreen);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Бүртгэлтэй юу?',
                    style: TextStyle(fontSize: 14, color: MyColors.grey600),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Нэвтрэх',
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
