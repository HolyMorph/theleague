import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class SportDescriptionItem extends StatelessWidget {
  const SportDescriptionItem({super.key});

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
        children: [
          Icon(Icons.sports),
          const SizedBox(width: 8),
          Text(
            'Сагсан бөмбөг',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: MyColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }
}
