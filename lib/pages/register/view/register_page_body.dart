import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/register_controller.dart';

class RegisterPageBody extends GetView<RegisterController> {
  RegisterPageBody({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  StatelessElement createElement() {
    String number = controller.state.registerController.text[controller.state.registerController.text.length - 2];
    controller.state.selectedGender.value = int.parse(number).isOdd ? 'Эрэгтэй' : 'Эмэгтэй';

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Хүйс',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.grey700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.errorColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ObxValue(
              (gender) => InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Cонгох'),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(16),
                    value: gender.value,
                    onChanged: (newValue) => controller.state.selectedGender.value = newValue ?? '',
                    dropdownColor: Colors.white,
                    elevation: 8,
                    items: <String>['Эрэгтэй', 'Эмэгтэй'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              controller.state.selectedGender,
            ),
            const SizedBox(height: 16),
            SettingsTextField(
              title: 'Өндөр',
              hintText: 'Өндөр',
              isRequired: true,
              inputType: TextInputType.number,
              errorText: 'Өндөр оруулна уу',
              textEditingController: controller.state.heightController,
              isActive: true,
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
              title: 'Жин',
              hintText: 'Жин',
              isRequired: true,
              errorText: 'Жин оруулна уу',
              inputType: TextInputType.number,
              textEditingController: controller.state.weightController,
              isActive: true,
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
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.state.pageController.nextPage(
                    duration: 500.milliseconds,
                    curve: Curves.decelerate,
                  );
                }
              },
              child: Text('Үргэлжлүүлэх'),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
