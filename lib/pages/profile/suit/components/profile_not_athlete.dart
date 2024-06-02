import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../../core/logic/core_controller.dart';
import '../../../register/suit/register_routes.dart';

class ProfileNotAthlete extends StatelessWidget {
  const ProfileNotAthlete({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: MyColors.grey200),
            child: Icon(Icons.person, size: 60, color: MyColors.grey500),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${Get.find<CoreController>().state.meData['name'] ?? 'Sport Lab хэрэглэгч'}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: MyColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Material(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Get.toNamed(RegisterRoutes.registerTypeScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Тамирчин болох',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
