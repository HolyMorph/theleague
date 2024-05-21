import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/schedule_information.dart';
import '../../../style/my_colors.dart';
import '../logic/competition_detail_controller.dart';
import '../suit/component/competition_header.dart';
import '../suit/component/register_button.dart';
import '../suit/component/registered_button.dart';
import '../suit/component/scoreboard_schedule_item.dart';
import '../suit/component/sport_description_item.dart';

class CompetitionDetailScreen extends GetView<CompetitionDetailController> {
  const CompetitionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CompetitionHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Children Day 3x3'),
                  const SizedBox(height: 8),
                  Text('Зохион байгуулагч: SportsLab LLC'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SportDescriptionItem(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ScheduleInformation(
                    location: 'Хүүхдийн парк',
                    date: 'Бя, 6 сарын 1 - Ня, 6 сарын 2',
                    time: '10:00 - 21:00',
                  ),
                  const SizedBox(height: 24),
                  ScoreboardScheduleItem(),
                  const SizedBox(height: 24),
                  Text(
                    'Дэлгэрэнгүй мэдээлэл',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                    style: TextStyle(color: MyColors.grey500, fontSize: 12),
                  ),
                  const SizedBox(height: 24),
                  RegisteredButton(),
                  const SizedBox(height: 24),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
          RegisterButton(),
        ],
      ),
    );
  }
}
