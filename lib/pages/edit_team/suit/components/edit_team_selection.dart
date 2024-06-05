import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../../../utils/qr_scanner.dart';
import '../../../create_team/suit/component/search_member_cart.dart';
import '../../logic/edit_team_controller.dart';
import 'edit_team_bottomsheet.dart';

class EditTeamSelection extends GetView<EditTeamController> {
  const EditTeamSelection({super.key});

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
        if (controller.state.isMeOwner.value)
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
                      EditTeamBottomSheet(),
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
                          var (isSuccess, response) = await controller.addMember(code: code);
                          if (isSuccess) {
                            var (success, response) = await controller.getTeamDetail();
                            if (success) {
                              AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Тамирчин нэмэгдлээ');
                            } else {
                              AlertHelper.showFlashAlert(
                                title: 'Алдаа',
                                message: response['message'] ?? 'Хүсэлт амжилтгүй',
                                status: FlashStatus.failed,
                              );
                            }
                          } else {
                            AlertHelper.showFlashAlert(
                              title: 'Алдаа',
                              message: response['message'] ?? 'Хүсэлт амжилтгүй',
                              status: FlashStatus.failed,
                            );
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
          (team) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: team['members'].length,
              itemBuilder: (context, index) {
                return SearchMemberCart(
                  player: team['members'][index],
                  onRemove: controller.state.isMeOwner.value
                      ? () async {
                          var (isSuccess, response) = await controller.removeMember(code: team['members'][index]['code']);
                          if (isSuccess) {
                            var (success, response) = await controller.getTeamDetail();
                            if (success) {
                              AlertHelper.showFlashAlert(title: 'Хасагдлаа', message: 'Тамирчин хасагдлаа');
                            } else {
                              AlertHelper.showFlashAlert(
                                title: 'Алдаа',
                                message: response['message'] ?? 'Хүсэлт амжилтгүй',
                                status: FlashStatus.failed,
                              );
                            }
                          } else {
                            AlertHelper.showFlashAlert(
                              title: 'Алдаа',
                              message: response['message'] ?? 'Хүсэлт амжилтгүй',
                              status: FlashStatus.failed,
                            );
                          }
                        }
                      : null,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
            );
          },
          controller.state.myTeam,
        ),
      ],
    );
  }
}
