import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../logic/register_controller.dart';

class RegisterProgress extends GetView<RegisterController> {
  const RegisterProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (selectedIndex) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${selectedIndex.value + 1}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Бүртгэл үүсгэх',
                style: TextStyle(
                  fontSize: 16,
                  color: MyColors.grey900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: getProgress(selectedIndex.value),
            borderRadius: BorderRadius.circular(4),
            backgroundColor: MyColors.progressGrey,
          ),
          const SizedBox(height: 8),
          Text(
            getTitle(selectedIndex.value),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MyColors.grey600,
            ),
          ),
        ],
      ),
      controller.state.selectedIndex,
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Хувийн мэдээлэл';
      case 1:
        return 'Бие бялдарын мэдээлэл';
      case 2:
        return 'Нэмэлт мэдээлэл';
      default:
        return '';
    }
  }

  double getProgress(int index) {
    switch (index) {
      case 0:
        return 0.35;
      case 1:
        return 0.7;
      case 2:
        return 1.0;
      default:
        return 0.0;
    }
  }
}
