import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../suit/components/profile_info.dart';
import '../suit/components/settings_save_button.dart';
import '../suit/components/settings_textfield.dart';

class ProfileSettingScreen extends StatelessWidget {
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
                    title: 'Нэр',
                    initialValue: 'Муунохой-Уудамсалтай',
                    isActive: true,
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Овог',
                    initialValue: 'Сугарбар-Онгонтамирдалт',
                    isActive: true,
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Регистрийн дугаар',
                    initialValue: 'ДИ00121314',
                    isActive: false,
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Жин',
                    initialValue: '79',
                    isActive: true,
                    suffix: Text(
                      'кг',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.greyBlue800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SettingsTextField(
                    title: 'Өндөр',
                    initialValue: '168',
                    isActive: true,
                    suffix: Text(
                      'см',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.greyBlue800,
                      ),
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
                  SettingsTextField(
                    title: 'Утасны дугаар',
                    initialValue: '99000052',
                    prefix: Text(
                      FaIcon.phone,
                      style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
                    ).paddingOnly(right: 8),
                    isActive: true,
                  ),
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
