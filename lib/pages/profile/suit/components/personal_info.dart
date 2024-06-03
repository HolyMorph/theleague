import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../../../style/style_export.dart';
import '../../logic/profile_controller.dart';

class PersonalInfo extends GetView<ProfileController> {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: '${controller.coreController.state.meData['avatar']}',
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
                  child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
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
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'${controller.coreController.state.meData['lastName']}'[0]}.${controller.coreController.state.meData['firstName']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: MyColors.greyBlue800,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      copyData(controller.coreController.state.meData['code']);
                    },
                    child: Row(
                      children: [
                        Text(
                          'SportLab ID: ',
                          style: TextStyle(fontSize: 14, color: MyColors.darkGrey),
                        ),
                        Text(
                          '${controller.coreController.state.meData['code']}',
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
          ObxValue(
            (meData) {
              if (meData['type'] == 'athelete')
                return Column(
                  children: [
                    const SizedBox(height: 24),
                    const Divider(height: 1, thickness: 1, color: MyColors.grey100),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              meData['gender'] == 'male' ? 'Эр' : 'Эм',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MyColors.greyBlue800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Хүйс',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: MyColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${meData['height']}см',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MyColors.greyBlue800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Өндөр',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: MyColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${meData['weight']}кг',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: MyColors.greyBlue800,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Жин',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: MyColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              else
                return const SizedBox();
            },
            controller.coreController.state.meData,
          ),
        ],
      ),
    );
  }

  void copyData(String data) {
    Clipboard.setData(new ClipboardData(text: data));
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          'Хуулж авлаа'.tr,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: MyColors.primaryColor,
        duration: const Duration(milliseconds: 1200),
      ),
    );
  }
}
