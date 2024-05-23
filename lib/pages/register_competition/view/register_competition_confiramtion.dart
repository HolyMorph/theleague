import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../suit/components/competition_info.dart';
import '../suit/components/personal_info.dart';
import '../suit/components/team_info.dart';

class RegisterCompetitionConfirmation extends StatelessWidget {
  const RegisterCompetitionConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        title: Text('Бүртгэлийн мэдээлэл'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CompetitionInfo(competitionInfo: {}),
            const SizedBox(height: 16),
            PersonalInfo(personalInfo: {}),
            const SizedBox(height: 16),
            TeamInfo(),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
