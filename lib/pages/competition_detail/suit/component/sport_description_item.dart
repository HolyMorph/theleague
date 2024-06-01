import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';

class SportDescriptionItem extends StatelessWidget {
  final String category;
  const SportDescriptionItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 1, color: MyColors.neutral200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              FaIcon.medal,
              style: FaIcon.regular(),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            category.capitalizeFirst ?? '',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: MyColors.grey700,
            ),
          ),
        ],
      ),
    );
  }
}
