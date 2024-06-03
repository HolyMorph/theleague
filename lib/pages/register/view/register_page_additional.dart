import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../components/my_image_picker.dart';
import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../core/logic/core_controller.dart';
import '../../core/suit/core_routes.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/register_controller.dart';
import '../suit/components/register_next_button.dart';

class RegisterPageAdditional extends GetView<RegisterController> {
  const RegisterPageAdditional({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsTextField(
                title: 'Утасны дугаар',
                hintText: 'Утасны дугаар',
                textEditingController: controller.state.phoneNumberController,
                inputType: TextInputType.number,
                customValidation: (value) {},
                prefix: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    FaIcon.phone,
                    textAlign: TextAlign.center,
                    style: FaIcon.regular().copyWith(color: MyColors.darkGrey, fontSize: 16),
                  ),
                ),
                isActive: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    'Цээж зураг',
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
              MyImagePicker(
                selectedImage: controller.state.selectedImage,
                onDelete: () => controller.state.avatarUrl.value = '',
              ),
              const SizedBox(height: 8),
              Text(
                'Цээж зураг сонговол илүү тохиромжтой.',
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.grey600,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
        Obx(
          () {
            bool isEmailPassVerified = (controller.state.passwordValid.value && controller.state.emailController.text.isNotEmpty);
            if (Get.find<CoreController>().state.meData['type'] == 'clientuser') isEmailPassVerified = true;
            bool isPersonalVerified = (controller.state.firstNameController.text.isNotEmpty &&
                controller.state.lastNameController.text.isNotEmpty &&
                controller.state.registerController.text.isNotEmpty);
            bool bodyVerified = (controller.state.heightController.text.isNotEmpty &&
                controller.state.weightController.text.isNotEmpty &&
                controller.state.selectedGender.value.isNotEmpty);
            return RegisterNextButton(
              buttonText: 'Дуусгах',
              onNext: (isEmailPassVerified && isPersonalVerified && bodyVerified)
                  ? () async {
                      FocusScope.of(context).unfocus();
                      if (controller.state.selectedImage.value != null) {
                        var (isSuccess, response) = await controller.athleteRegister();
                        if (isSuccess) {
                          FocusScope.of(context).unfocus();
                          Get.until(
                            (route) => Get.currentRoute == (controller.state.from.isNotEmpty ? controller.state.from.value : CoreRoutes.coreScreen),
                          );
                          await Get.find<CoreController>().getMeData();
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
                        AlertHelper.showFlashAlert(
                          title: 'Уучлаарай',
                          message: 'Цээж зураг оруулаагүй байна.',
                          status: FlashStatus.warning,
                        );
                      }
                    }
                  : null,
              onBack: () {
                controller.state.pageController.previousPage(
                  duration: 500.milliseconds,
                  curve: Curves.decelerate,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
