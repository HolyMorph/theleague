import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../logic/create_team_controller.dart';
import 'search_member_cart.dart';

class SearchMemberBottomSheet extends GetView<CreateTeamController> {
  SearchMemberBottomSheet({super.key});

  final RxMap member = RxMap();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Тамирчин нэмэх',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: MyColors.grey200, height: 1, thickness: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.state.textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        FaIcon.search,
                        style: FaIcon.regular().copyWith(
                          fontSize: 18,
                          color: MyColors.grey500,
                        ),
                      ),
                    ),
                    hintText: 'Sportlab ID-гаар хайх',
                    hintMaxLines: 1,
                  ),
                  onEditingComplete: () async {},
                ),
              ),
              const SizedBox(width: 8),
              ObxValue(
                (searching) => SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (controller.state.textEditingController.text.isNotEmpty) {
                        await _searchMember();
                      }
                    },
                    child: searching.value ? const CupertinoActivityIndicator(color: Colors.white) : Text('Хайх'),
                  ),
                ),
                controller.state.isSearching,
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
          const SizedBox(height: 16),
          ObxValue(
            (searchMember) => (member.isNotEmpty)
                ? InkWell(
                    onTap: () {
                      Get.back();
                      if (controller.state.teamMembers.isEmpty) {
                        controller.state.teamMembers.add(member);
                      } else {
                        controller.state.teamMembers.forEach((element) {
                          if (element['code'] != member['code']) {
                            controller.state.teamMembers.add(member);
                          }
                        });
                      }
                    },
                    child: SearchMemberCart(player: member),
                  ).paddingSymmetric(horizontal: 16)
                : const SizedBox(),
            member,
          ),
        ],
      ).paddingSymmetric(vertical: 16),
    );
  }

  Future<void> _searchMember() async {
    FocusScope.of(Get.context!).unfocus();
    if (controller.state.textEditingController.text.isNotEmpty) {
      var (isSuccess, response) = await controller.searchMember();
      if (isSuccess) {
        if (response['result'] == null) {
          AlertHelper.showFlashAlert(
            title: 'Уучлаарай',
            message: 'Илэрц олдсонгүй',
            status: FlashStatus.warning,
          );
        } else {
          member.value = response['result'] ?? {};
        }
      } else {
        AlertHelper.showFlashAlert(
          title: 'Уучлаарай',
          message: 'Илэрц олдсонгүй',
          status: FlashStatus.warning,
        );
      }
    }
  }
}
