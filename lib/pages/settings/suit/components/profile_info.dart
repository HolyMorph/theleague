import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../../../style/style_export.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

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
                imageUrl: '?size=w100',
                imageBuilder: (context, imageProvider) => Container(
                  height: 80,
                  width: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
                    boxShadow: [],
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
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'С. Муунохой-Уудамсалтай',
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
                          'djgsajdgas',
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
    );
  }
}
