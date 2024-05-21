import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class ScoreboardScheduleItem extends StatelessWidget {
  const ScoreboardScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(Icons.developer_board_off_rounded, color: MyColors.primaryColor),
            const SizedBox(width: 4),
            Text(
              'Хуваарь & оноо харах',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: MyColors.primaryColor,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.black,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
