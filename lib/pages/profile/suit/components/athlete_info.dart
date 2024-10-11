import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';

class AthleteInfo extends StatelessWidget {
  final dynamic userData;
  const AthleteInfo({required this.userData, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: '${userData['avatar']}',
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
              '${'${userData['lastName']}'[0]}.${userData['firstName']}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: MyColors.greyBlue800,
              ),
            ),
            InkWell(
              onTap: () {
                copyData(userData['code']);
              },
              child: Row(
                children: [
                  Text(
                    'SportLab ID: ',
                    style: TextStyle(fontSize: 14, color: MyColors.darkGrey),
                  ),
                  Text(
                    '${userData['code']}',
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
    ).paddingAll(16);
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
