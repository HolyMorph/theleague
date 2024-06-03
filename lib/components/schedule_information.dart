import 'package:flutter/material.dart';

import '../style/my_colors.dart';
import '../utils/fa_icon.dart';

class ScheduleInformation extends StatelessWidget {
  final String location;
  final String time;
  final String date;
  const ScheduleInformation({required this.location, required this.date, required this.time, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                FaIcon.location_dot,
                style: FaIcon.regular().copyWith(color: MyColors.grey500, fontSize: 14),
              ),
              const SizedBox(width: 4),
              Text(
                location,
                style: TextStyle(fontSize: 14, color: MyColors.grey500),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                FaIcon.clock,
                style: FaIcon.regular().copyWith(color: MyColors.grey500, fontSize: 14),
              ),
              const SizedBox(width: 4),
              Text(
                time,
                style: TextStyle(fontSize: 14, color: MyColors.grey500),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                FaIcon.calendar,
                style: FaIcon.regular().copyWith(color: MyColors.grey500, fontSize: 14),
              ),
              const SizedBox(width: 4),
              Text(
                date,
                style: TextStyle(fontSize: 14, color: MyColors.grey500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
