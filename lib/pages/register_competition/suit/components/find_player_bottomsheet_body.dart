import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../logic/register_competition_controller.dart';
import 'find_player_item.dart';

class FindPlayerBottomSheetBody extends GetView<RegisterCompetitionController> {
  const FindPlayerBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 14),
          Text(
            'Тамирчин нэмэх',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, thickness: 1, color: MyColors.neutral200),
          Column(
            children: [
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: MyColors.grey500.withOpacity(0.5),
                  ),
                  hintText: 'Sportlab ID-гаар хайх',
                ),
              ),
              const SizedBox(height: 12),
              FindPlayerItem(
                player: {
                  'name': 'Сэнгэл Зэвэрсэнбаатар',
                  'sportLabId': 'ABC091723',
                  'image': 'image',
                  'isVerified': false,
                },
                selectedPlayer: (selectedPlayer) {
                  if (controller.state.selectedTeamMembers.isEmpty) {
                    controller.state.selectedTeamMembers.add(selectedPlayer);
                  } else {
                    controller.state.selectedTeamMembers.forEach((player) {
                      if (player['sportLabId'] != selectedPlayer['sportLabId']) {
                        controller.state.selectedTeamMembers.add(selectedPlayer);
                      } else {
                        AlertHelper.showFlashAlert(title: 'Уучлаарай', message: 'Сонгогдсон тоглогч байна.', status: FlashStatus.warning);
                      }
                    });
                  }
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
        ],
      ),
    );
  }
}
