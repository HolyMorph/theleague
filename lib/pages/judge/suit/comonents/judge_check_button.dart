import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../logic/judge_controller.dart';

class JudgeCheckButton extends GetView<JudgeController> {
  const JudgeCheckButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          border: Border(
            top: BorderSide(width: 1, color: MyColors.grey300),
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(disabledBackgroundColor: MyColors.successColor),
          onPressed: (controller.state.entryData['entryStatus'] == 'checked' || controller.state.isChecked.value)
              ? null
              : () async {
                  var (isSuccess, response) = await controller.checkJudge();
                  if (!isSuccess) {
                    AlertHelper.showFlashAlert(
                      title: 'Алдаа',
                      message: response['message'] ?? 'Хүсэлт амжилтгүй',
                      status: FlashStatus.failed,
                    );
                  }
                },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                FaIcon.circle_check,
                style: FaIcon.light().copyWith(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(width: 8),
              Text(
                (controller.state.entryData['entryStatus'] == 'checked' || controller.state.isChecked.value) ? 'Шалгасан' : 'Шалгах',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
