import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../logic/home_controller.dart';

class CoachButton extends GetView<HomeController> {
  const CoachButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(
          int.parse(
            '0xFF${LocalStorage.getData('coachData')['teamColor'].substring(1, LocalStorage.getData('coachData')['teamColor'].length)}',
          ),
        ),
        disabledBackgroundColor: Color(
          int.parse(
            '0xFF${LocalStorage.getData('coachData')['teamColor'].substring(1, LocalStorage.getData('coachData')['teamColor'].length)}',
          ),
        ).withOpacity(0.4),
      ),
      onPressed: checkFunction,
      child: Text(
        'Саналаа өгөх',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'GIP'),
      ),
    );
  }

  Future<void> checkFunction() async {
    if (controller.state.totalQty.value < 12) {
      AlertHelper.showFlashAlert(
        title: 'Уучлаарай',
        message: 'Та 12 тоглогч бүрэн сонгоогүй байна.',
        status: FlashStatus.failed,
      );
    } else {
      AlertHelper.showDialog(
        message: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Та саналаа өгөхдөө итгэлтэй байна уу? Та багийн санал өгч байгаа тул ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GIP',
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'нэг л удаа ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GIP',
                  color: MyColors.secondaryColor,
                ),
              ),
              TextSpan(
                text: 'өгөх боломжтойг анхаарна уу.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GIP',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        onTap: () async {
          Get.back();
          await controller.voteCoach();
        },
      );
    }
  }
}
