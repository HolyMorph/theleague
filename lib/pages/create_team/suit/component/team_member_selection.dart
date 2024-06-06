import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../utils/qr_scanner.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Багийн гишүүд',
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
                          AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Тамирчин багт нэмэгдлээ');
                        } else {
                          Map exist = controller.state.teamMembers.firstWhereOrNull((element) => element['code'] == response['result']['code']) ?? {};
                          if (exist.isEmpty) {
                            controller.state.teamMembers.add(response['result']);
                            AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Тамирчин багт нэмэгдлээ');
                          }
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
        ObxValue(
          (members) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: members.length,
              itemBuilder: (context, index) {
                return SearchMemberCart(
                  player: members[index],
                  onRemove: () {
                    members.removeWhere((element) => element['code'] == members[index]['code']);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
            );
          },
          controller.state.teamMembers,
        ),
      ],
    );
  }
}
