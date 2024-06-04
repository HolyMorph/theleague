import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../logic/judge_controller.dart';

class JudgeCompetitionInfo extends GetView<JudgeController> {
  const JudgeCompetitionInfo({super.key});

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
                    imageUrl: '${controller.state.gameData['logo_square']}?size=w200',
                    alignment: Alignment.center,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.state.gameData['name']}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Зохион байгуулагч: ${controller.state.gameData['organizerName']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: MyColors.darkGrey,
                          ),
                        ),
                      ],
                    ),
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
                        '${controller.state.gameData['meta']['genderDictionary']['${controller.state.gameData['gender']}']}',
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
                        '${controller.state.gameData['meta']['gameTypeDictionary']['${controller.state.gameData['gameType']}']}',
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
                        '${controller.state.gameData['restrictionMinAge']}-${controller.state.gameData['restrictionMaxAge']}',
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
