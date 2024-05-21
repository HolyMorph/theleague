import 'package:flutter/material.dart';

import '../style/my_colors.dart';

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
              Icon(Icons.location_on, color: MyColors.grey500),
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
              Icon(Icons.access_time_outlined, color: MyColors.grey500),
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
              Icon(Icons.date_range, color: MyColors.grey500),
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
