import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../../style/style_export.dart';
import '../../logic/judge_controller.dart';

class PersonInfo extends GetView<JudgeController> {
  const PersonInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 8,
              color: MyColors.grey200,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: '${controller.state.entryData['avatar']}',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 120,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    height: 120,
                    width: 90,
                    child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 120,
                    width: 90,
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
                      '${'${controller.state.entryData['lastName']}'[0]}.${controller.state.entryData['firstName']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColors.greyBlue800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'PД: ${controller.state.entryData['registrationNumber']}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: MyColors.greyBlue800,
                          ),
                        ),
                        if (controller.state.entryData['age'] != null)
                          Text(
                            ', Нас: ${controller.state.entryData['age']}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: MyColors.greyBlue800,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'SportLab ID: ',
                          style: TextStyle(fontSize: 14, color: MyColors.grey600),
                        ),
                        Text(
                          '${controller.state.entryData['code']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: MyColors.greyBlue800,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
            // Column(
            //   children: [
            //     const SizedBox(height: 24),
            //     const Divider(height: 1, thickness: 1, color: MyColors.grey100),
            //     const SizedBox(height: 8),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Column(
            //           children: [
            //             Text(
            //               controller.state.entryData['gender'] == 'male' ? 'Эр' : 'Эм',
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w600,
            //                 color: MyColors.greyBlue800,
            //               ),
            //             ),
            //             const SizedBox(height: 4),
            //             Text(
            //               'Хүйс',
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w500,
            //                 color: MyColors.darkGrey,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Text(
            //               '${controller.state.entryData['height']}см',
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w600,
            //                 color: MyColors.greyBlue800,
            //               ),
            //             ),
            //             const SizedBox(height: 4),
            //             Text(
            //               'Өндөр',
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w500,
            //                 color: MyColors.darkGrey,
            //               ),
            //             ),
            //           ],
            //         ),
            //         Column(
            //           children: [
            //             Text(
            //               '${controller.state.entryData['weight']}кг',
            //               style: TextStyle(
            //                 fontSize: 16,
            //                 fontWeight: FontWeight.w600,
            //                 color: MyColors.greyBlue800,
            //               ),
            //             ),
            //             const SizedBox(height: 4),
            //             Text(
            //               'Жин',
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w500,
            //                 color: MyColors.darkGrey,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
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
