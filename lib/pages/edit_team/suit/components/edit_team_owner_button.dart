import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../../my_teams/logic/my_teams_controller.dart';
import '../../logic/edit_team_controller.dart';

class EditTeamOwnerButton extends GetView<EditTeamController> {
  const EditTeamOwnerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.errorColor.withOpacity(0.07),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(width: 1, color: MyColors.statusFailed),
            ),
          ),
          onPressed: () {
            deleteTeam();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FaIcon.trash,
                style: FaIcon.regular().copyWith(color: MyColors.statusFailed, fontSize: 16),
              ),
              const SizedBox(width: 8),
              Text(
                'Баг устгах',
                style: TextStyle(fontSize: 14, color: MyColors.statusFailed),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => ElevatedButton(
            onPressed: controller.state.newTeamName.isNotEmpty || controller.state.selectedImage.value != null
                ? () async {
                    var (isSuccess, response) = await controller.updateTeam();
                    if (isSuccess) {
                      AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Багын мэдээлэл шинэчлэгдлээ');

                      if (controller.state.from.isNotEmpty) {
                        Get.until((route) => Get.currentRoute == controller.state.from.value);
                      } else {
                        Get.back();
                        Get.find<MyTeamsController>().getMyTeams();
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
            child: Text(
              'Хадгалах',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void deleteTeam() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: MyColors.grey200),
                  ),
                  child: Text(
                    FaIcon.quit,
                    style: FaIcon.regular().copyWith(fontSize: 16, color: MyColors.neutral900),
                  ),
                ),
                IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Баг устгах',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: MyColors.neutral900,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Та багийн бүртгэлээ устгахдаа итгэлтэй байна уу?',
              style: TextStyle(
                fontSize: 14,
                color: MyColors.grey600,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: MyColors.errorColor),
              onPressed: () async {
                Get.back();
                var (isSuccess, response) = await controller.deleteTeam();
                if (isSuccess) {
                  AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Баг устгагдлаа');
                  Get.back();
                  Get.find<MyTeamsController>().getMyTeams();
                } else {
                  AlertHelper.showFlashAlert(
                    title: 'Алдаа',
                    message: response['message'] ?? 'Хүсэлт амжилтгүй',
                    status: FlashStatus.failed,
                  );
                }
              },
              child: Text('Устгах'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 1, color: MyColors.grey300),
                ),
              ),
              onPressed: () => Get.back(),
              child: Text(
                'Болих',
                style: TextStyle(color: MyColors.primaryColor, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
