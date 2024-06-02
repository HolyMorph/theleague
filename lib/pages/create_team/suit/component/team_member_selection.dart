import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../qr_scanner.dart';
import '../../../../style/my_colors.dart';
import '../../../../style/style_export.dart';
import '../../../../utils/fa_icon.dart';
import '../../logic/create_team_controller.dart';
import 'search_member_bottomsheet.dart';
import 'search_member_cart.dart';

class TeamMemberSelection extends GetView<CreateTeamController> {
  const TeamMemberSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Багийн гишүүд (3-4)',
            style: TextStyle(
              color: MyColors.grey700,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      isScrollControlled: true,
                      SearchMemberBottomSheet(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(width: 1, color: MyColors.grey300),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FaIcon.user,
                        style: FaIcon.regular().copyWith(color: MyColors.primaryColor),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Тамирчин нэмэх',
                        style: TextStyle(color: MyColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ObxValue(
                (search) => InkWell(
                  onTap: () async {
                    String? code = await Get.to(() => QrScanner());

                    if (code != null) {
                      var (isSuccess, response) = await controller.searchMember(code: code);

                      if (isSuccess) {
                        if (response['result'] == null) {
                          AlertHelper.showFlashAlert(
                            title: 'Уучлаарай',
                            message: 'Илэрц олдсонгүй',
                            status: FlashStatus.warning,
                          );
                        } else {
                          if (controller.state.teamMembers.isEmpty) {
                            controller.state.teamMembers.add(response['result']);
                          } else {
                            controller.state.teamMembers.forEach((element) {
                              if (element['code'] != response['result']['code']) {
                                controller.state.teamMembers.add(response['result']);
                              }
                            });
                          }
                        }
                      } else {
                        AlertHelper.showFlashAlert(
                          title: 'Уучлаарай',
                          message: 'Илэрц олдсонгүй',
                          status: FlashStatus.warning,
                        );
                      }
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: MyColors.grey300),
                      color: Colors.white,
                    ),
                    child: search.value
                        ? const CupertinoActivityIndicator(color: MyColors.primaryColor)
                        : Icon(Icons.qr_code, color: MyColors.primaryColor),
                  ),
                ),
                controller.state.isSearching,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ObxValue(
              (members) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    return SearchMemberCart(
                      player: members[index],
                      onRemove: () {
                        members.removeWhere((element) => element['code'] == members[index]['code']);
                      },
                    );
                  },
                );
              },
              controller.state.teamMembers,
            ),
          ),
        ],
      ),
    );
  }
}
