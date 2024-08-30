import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../style/my_colors.dart';
import '../../../core/logic/core_controller.dart';
import '../../logic/settings_controller.dart';

class SettingsSaveButton extends GetView<SettingsController> {
  const SettingsSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(width: 1, color: MyColors.grey200),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: MyColors.grey200,
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () async {
          if (controller.state.height.isNotEmpty || controller.state.weight.isNotEmpty) {
            var (isSuccess, response) = await controller.changeHeightWeight();
            if (isSuccess) {
              if (isSuccess) {
                AlertHelper.showFlashAlert(title: 'Амжилттай', message: 'Мэдээлэл амжилттай солигдлоо');
                Get.find<CoreController>().getMeData();
              } else {
                AlertHelper.showFlashAlert(
                  title: 'Алдаа',
                  message: '${response['message']}',
                  status: FlashStatus.failed,
                );
              }
            }
          }
        },
        child: controller.state.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text('Хадгалах'),
      ),
    );
  }
}
