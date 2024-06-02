import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../style/my_colors.dart';
import '../utils/basic_utils.dart';
import '../utils/fa_icon.dart';

class MyImagePicker extends StatelessWidget {
  final Rx<XFile?> selectedImage;
  final VoidCallback onDelete;
  final bool? isHaveCamera;
  const MyImagePicker({required this.selectedImage, required this.onDelete, this.isHaveCamera, super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
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
                      onDelete();
                      selectedImage.value = null;
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
                      (isHaveCamera != null && isHaveCamera == false)
                          ? selectedImage.value = await BasicUtils().onImageButtonPressed(ImageSource.gallery)
                          : Get.bottomSheet(
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
                                      selectedImage.value = await BasicUtils().onImageButtonPressed(ImageSource.camera);
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
                                      selectedImage.value = await BasicUtils().onImageButtonPressed(ImageSource.gallery);
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
      selectedImage,
    );
  }
}
