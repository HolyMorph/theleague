import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';

class CompetitionInfo extends StatelessWidget {
  final dynamic competitionInfo;
  const CompetitionInfo({required this.competitionInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Тэмцээний мэдээлэл',
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
                    imageUrl: '${competitionInfo['logo']}?size=w200',
                    alignment: Alignment.center,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error_outline,
                      size: 30,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${competitionInfo['name']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Зохион байгуулагч: ${competitionInfo['organizer']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: MyColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(8),
              Divider(height: 1, thickness: 1, color: MyColors.grey100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '${competitionInfo['gender']}',
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
                        '${competitionInfo['type']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.greyBlue800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Төрөл',
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
                        '${competitionInfo['age']}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MyColors.greyBlue800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Нас',
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
    );
  }
}
