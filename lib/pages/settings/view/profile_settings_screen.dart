import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../../../style/style_export.dart';
import '../../../utils/fa_icon.dart';
import '../logic/settings_controller.dart';
import '../suit/components/profile_info.dart';
import '../suit/components/settings_save_button.dart';
import '../suit/components/settings_textfield.dart';

class ProfileSettingScreen extends GetView<SettingsController> {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        title: Text('Хувийн мэдээлэл'),
      ),
      body: Column(
        children: [
          ProfileInfo(),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  SettingsTextField(
                    hintText: 'Нэр оруулах',
                    title: 'Нэр',
                    initialValue: controller.state.userData['firstName'] ?? 'Нэр',
                    isActive: false,
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Овог',
                    hintText: 'Овог оруулах',
                    initialValue: controller.state.userData['lastName'] ?? 'Овог',
                    isActive: false,
                  ),
                  // const SizedBox(height: 16),
                  // SettingsTextField(
                  //   title: 'Регистрийн дугаар',
                  //   hintText: 'Регистрийн дугаар',
                  //   initialValue: 'ДИ00121314',
                  //   isActive: false,
                  // ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Жин',
                    initialValue: controller.state.userData['weight'].toString(),
                    hintText: 'Жин',
                    isActive: true,
                    inputType: TextInputType.number,
                    onChanged: (input) => controller.state.weight.value = input,
                    suffix: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'кг',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.greyBlue800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Өндөр',
                    hintText: 'Өндөр',
                    initialValue: controller.state.userData['height'].toString(),
                    isActive: true,
                    inputType: TextInputType.number,
                    onChanged: (input) => controller.state.height.value = input,
                    suffix: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'см',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.greyBlue800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Цахим хаяг',
                    hintText: 'Цахим хаяг',
                    prefix: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        FaIcon.email,
                        style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
                      ).paddingOnly(right: 8),
                    ),
                    initialValue: controller.state.userData['email'] ?? 'Цахим хаяг',
                    isActive: false,
                  ),
                  // const SizedBox(height: 16),
                  // SettingsTextField(
                  //   title: 'Утасны дугаар',
                  //   hintText: 'Утасны дугаар',
                  //   initialValue: '99000052',
                  //   prefix: FittedBox(
                  //     fit: BoxFit.scaleDown,
                  //     child: Text(
                  //       FaIcon.phone,
                  //       style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
                  //     ).paddingOnly(right: 8),
                  //   ),
                  //   isActive: true,
                  // ),
                ],
              ).paddingAll(16),
            ),
          ),
          SettingsSaveButton(),
        ],
      ),
    );
  }
}
