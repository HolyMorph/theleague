import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/register_controller.dart';

class RegisterPageBody extends GetView<RegisterController> {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Хүйс',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: MyColors.grey700,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButton<String>(
          hint: Text('Хүйс сонгох'),
          value: controller.state.selectedGender.value,
          onChanged: (newValue) => controller.state.selectedGender.value = newValue ?? '',
          items: <String>['Эрэгтэй', 'Эмэгтэй'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
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
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          child: Text('Үргэлжлүүлэх'),
        ),
      ],
    );
  }
}
