import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../../core/logic/core_controller.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (meData) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Хувийн мэдээлэл',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: MyColors.grey700,
            ),
          ),
          const SizedBox(height: 8),
          DecoratedBox(
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
                      imageUrl: '${meData['avatar']}?size=w200',
                      alignment: Alignment.center,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 45,
                        width: 45,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 8,
                              color: MyColors.grey300,
                            ),
                          ],
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 45,
                        child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error_outline,
                        size: 24,
                        color: MyColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${meData['lastName'][0]}.${meData['firstName']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${meData['code']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: MyColors.grey600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      FaIcon.user_edit,
                      style: FaIcon.regular().copyWith(color: MyColors.primaryColor, fontSize: 18),
                    ),
                    const SizedBox(width: 16),
                  ],
                ).paddingAll(8),
                Divider(height: 1, thickness: 1, color: MyColors.grey100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${meData['gender'] == 'male' ? 'Эрэгтэй' : 'Эмэгтэй'}',
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
                          '${meData['height']}',
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
                          '${meData['weight']}',
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
                ).paddingAll(8),
              ],
            ),
          ),
        ],
      ),
      Get.find<CoreController>().state.meData,
    );
  }
}
