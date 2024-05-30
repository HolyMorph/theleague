import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../style/my_colors.dart';
import '../../../utils/fa_icon.dart';
import '../../settings/suit/components/settings_textfield.dart';
import '../logic/register_controller.dart';

class RegisterPageAdditional extends GetView<RegisterController> {
  RegisterPageAdditional({super.key});

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsTextField(
          title: 'Утасны дугаар',
          hintText: 'Утасны дугаар',
          textEditingController: controller.state.phoneNumberController,
          inputType: TextInputType.number,
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
        ObxValue(
          (image) => image.value != null
              ? Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: MyColors.grey300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.file(
                        File(image.value?.path ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () {
                          controller.state.selectedImage.value = null;
                          controller.state.avatarUrl.value = '';
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: MyColors.grey300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                FaIcon.trash,
                                style: FaIcon.regular().copyWith(
                                  color: MyColors.greyBlue800,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Устгах',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.greyBlue800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: MyColors.grey300),
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.grey500.withOpacity(0.2),
                      ),
                      child: Text(
                        FaIcon.image,
                        style: FaIcon.regular().copyWith(
                          fontSize: 20,
                          color: MyColors.grey500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () async {
                          Get.bottomSheet(
                            backgroundColor: Colors.white,
                            isScrollControlled: false,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.back();
                                    await _onImageButtonPressed(ImageSource.camera);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FaIcon.camera,
                                        style: FaIcon.regular().copyWith(color: Colors.white, fontSize: 18),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('Камер'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.back();
                                    await _onImageButtonPressed(ImageSource.gallery);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FaIcon.image,
                                        style: FaIcon.regular().copyWith(color: Colors.white, fontSize: 18),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('Зургийн цомог'),
                                    ],
                                  ),
                                ),
                              ],
                            ).paddingAll(16),
                          );
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: MyColors.grey300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(
                                FaIcon.upload_cloud,
                                style: FaIcon.regular().copyWith(color: MyColors.greyBlue800, fontSize: 14),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Зураг сонгох',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.greyBlue800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          controller.state.selectedImage,
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
        Obx(() {
          bool isEmailPassVerified = (controller.state.passwordController.text.isNotEmpty && controller.state.emailController.text.isNotEmpty);
          bool isPersonalVerified = (controller.state.firstNameController.text.isNotEmpty &&
              controller.state.lastNameController.text.isNotEmpty &&
              controller.state.registerController.text.isNotEmpty);
          bool bodyVerified = (controller.state.heightController.text.isNotEmpty &&
              controller.state.weightController.text.isNotEmpty &&
              controller.state.selectedGender.value.isNotEmpty);
          return ElevatedButton(
            onPressed: (isEmailPassVerified && isPersonalVerified && bodyVerified && controller.state.selectedImage.value != null)
                ? () async {
                    await controller.userRegister();
                  }
                : null,
            child: controller.state.isLoading.value ? const CupertinoActivityIndicator(color: Colors.white) : Text('Дуусгах'),
          );
        }),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Future<void> _onImageButtonPressed(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 100,
      );
      controller.state.selectedImage.value = pickedFile;
    } catch (e) {
      debugPrint('${e}');
    }
  }
}
