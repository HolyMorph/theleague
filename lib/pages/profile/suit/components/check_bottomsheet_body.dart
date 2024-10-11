import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import 'league_athelete_info.dart';

class CheckBottomSheetBody extends StatelessWidget {
  final dynamic athleteInfo;
  const CheckBottomSheetBody({required this.athleteInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Тоглогчийн мэдээлэл',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            IconButton(onPressed: () => Get.back(result: true), icon: Icon(Icons.close)),
          ],
        ).paddingSymmetric(horizontal: 16),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide(width: 1, color: MyColors.neutral100)),
          ),
          child: LeagueAthleteInfo(userData: athleteInfo),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: athleteInfo['isActive'] ? MyColors.successColor?.withOpacity(0.2) : MyColors.errorColor.withOpacity(0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              athleteInfo['isActive']
                  ? Text(
                      FaIcon.circle_check,
                      style: FaIcon.regular().copyWith(fontSize: 24, color: MyColors.successColor),
                    )
                  : Text(
                      FaIcon.xmark,
                      style: FaIcon.regular().copyWith(fontSize: 24, color: MyColors.errorColor),
                    ),
              const SizedBox(width: 8),
              Text(
                athleteInfo['isActive'] ? 'Идэвхитэй' : 'Идэвхигүй',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: athleteInfo['isActive'] ? MyColors.successColor : MyColors.errorColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
