import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../../../style/style_export.dart';
import '../../../../utils/basic_utils.dart';
import '../../../../utils/fa_icon.dart';
import '../../../core/logic/core_controller.dart';
import '../../logic/settings_controller.dart';

class ProfileInfo extends GetView<SettingsController> {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        _changeAvatar();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: '${controller.state.userData['avatar']}?size=w200',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 80,
                              width: 80,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 80,
                              child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 8,
                                    color: MyColors.grey200,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: MyColors.primaryColor,
                              ),
                            ),
                          ),
                          controller.state.isAvatarLoading.value
                              ? const Center(
                                  child: CupertinoActivityIndicator(color: MyColors.primaryColorDark),
                                )
                              : Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.4),
                                  ),
                                  child: Icon(Icons.camera_alt, color: Colors.white),
                                ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Зураг солих',
                      style: TextStyle(
                        color: MyColors.darkGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${controller.state.userData['name'] ?? controller.state.userData['firstName']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.greyBlue800,
                      ),
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            'Sportlab ID: ',
                            style: TextStyle(fontSize: 14, color: MyColors.darkGrey),
                          ),
                          Text(
                            '${controller.state.userData['code']}',
                            style: TextStyle(fontSize: 14, color: MyColors.greyBlue800),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.copy,
                            size: 16,
                            color: MyColors.greyBlue800,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
    );
  }

  void _changeAvatar() {
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
              controller.state.selectedImage.value = await BasicUtils().onImageButtonPressed(ImageSource.camera);
              var (isSuccess, response) = await controller.changeAvatar();
              if (isSuccess) {
                AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Зураг амжилттай солигдлоо');
                Get.find<CoreController>().getMeData();
              } else {
                AlertHelper.showFlashAlert(
                  title: 'Алдаа',
                  message: '${response['message']}',
                  status: FlashStatus.failed,
                );
              }
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
              controller.state.selectedImage.value = await BasicUtils().onImageButtonPressed(ImageSource.gallery);
              var (isSuccess, response) = await controller.changeAvatar();
              if (isSuccess) {
                AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Зураг амжилттай солигдлоо');
                Get.find<CoreController>().getMeData();
              } else {
                AlertHelper.showFlashAlert(
                  title: 'Алдаа',
                  message: '${response['message']}',
                  status: FlashStatus.failed,
                );
              }
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
  }
}
