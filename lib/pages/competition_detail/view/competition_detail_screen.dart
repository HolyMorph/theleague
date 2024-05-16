import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../logic/competition_detail_controller.dart';
import '../suit/component/competition_header.dart';
import '../suit/component/register_button.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Children Day 3x3'),
              const SizedBox(height: 8),
              Text('Зохион байгуулагч: SportsLab LLC'),
            ],
          ).paddingSymmetric(horizontal: 16),
          const Spacer(),
          RegisterButton(),
        ],
      ),
    );
  }
}
