import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../style/my_colors.dart';
import '../logic/register_controller.dart';
import '../suit/components/register_next_button.dart';

class RegisterPagePersonal extends GetView<RegisterController> {
  RegisterPagePersonal({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.state.lastNameController,
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[\u0400-\u04FF\u0500-\u052F\u2DE0-\u2DFF]+'),
                      ),
                    ],
                    decoration: InputDecoration(hintText: 'Овог'),
                    onChanged: (input) {
                      if (!RegExp(r'[\u0400-\u04FF\u0500-\u052F\u2DE0-\u2DFF]+').hasMatch(input)) {
                        AlertHelper.showFlashAlert(
                          title: 'Уучлаарай',
                          message: 'Крилл үсгээр бичнэ үү',
                          status: FlashStatus.warning,
                        );
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Овог оруулна уу';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.warning,
                        size: 16,
                        color: MyColors.statusWarning,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Зөвхөн крилл үсгээр бичнэ үү.',
                        style: TextStyle(fontSize: 12, color: MyColors.grey500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: controller.state.firstNameController,
                    textCapitalization: TextCapitalization.sentences,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[\u0400-\u04FF\u0500-\u052F\u2DE0-\u2DFF]+'),
                      ),
                    ],
                    decoration: InputDecoration(hintText: 'Нэр'),
                    onChanged: (input) {
                      if (!RegExp(r'[\u0400-\u04FF\u0500-\u052F\u2DE0-\u2DFF]+').hasMatch(input)) {
                        AlertHelper.showFlashAlert(title: 'Уучлаарай', message: 'Крилл үсгээр бичнэ үү', status: FlashStatus.warning);
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Нэр оруулна уу';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Регистрийн дугаар',
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
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: controller.state.registerController,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(RegExp(r'^[А-Яа-яЁёӨөҮү]{0,2}[0-9]*$')),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            if (newValue.text.length > 2 && newValue.text.substring(0, 2).contains(RegExp(r'[^А-Яа-яЁёӨөҮү]'))) {
                              return oldValue;
                            }
                            if (newValue.text.length > 2 && newValue.text.substring(2).contains(RegExp(r'[^0-9]'))) {
                              return oldValue;
                            }
                            return newValue;
                          }),
                        ],
                        decoration: InputDecoration(
                          hintText: 'Регистрийн дугаар',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Регистрийн дугаар оруулна уу';
                          }
                          if (value.length < 3 || !RegExp(r'^[А-Яа-яЁёӨөҮү]{2}[0-9]+$').hasMatch(value)) {
                            return 'Оруулсан мэдээлэл буруу байна.';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pегистрийн дугаарыг дараа нь засах боломжгүй тул үнэн зөвөөр бөглөнө үү.',
                    style: TextStyle(fontSize: 14, color: MyColors.grey600),
                  ),
                  const SizedBox(height: 8),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
          RegisterNextButton(
            buttonText: 'Үргэлжлүүлэх',
            onBack: () {
              Get.back();
              controller.state.firstNameController.clear();
              controller.state.lastNameController.clear();
              controller.state.registerController.clear();
              controller.state.heightController.clear();
              controller.state.weightController.clear();
              controller.state.phoneNumberController.clear();
              controller.state.selectedGender.value = '';
              controller.state.avatarUrl.value = '';
              controller.state.selectedImage.value = null;
            },
            onNext: () {
              FocusScope.of(context).unfocus();
              if (formKey.currentState!.validate()) {
                controller.state.pageController.nextPage(
                  duration: 500.milliseconds,
                  curve: Curves.decelerate,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
