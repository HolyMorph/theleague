import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../../competition_detail/logic/competition_detail_controller.dart';
import '../../payment/view/payment_button.dart';
import '../logic/register_competition_controller.dart';
import '../suit/components/competition_info.dart';
import '../suit/components/personal_info.dart';
import '../suit/components/register_team_cart.dart';

class RegisterCompetitionConfirmation extends GetView<RegisterCompetitionController> {
  const RegisterCompetitionConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: AppBar(
        title: Text('Бүртгэлийн мэдээлэл'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const CompetitionInfo(),
                  const SizedBox(height: 16),
                  const PersonalInfo(),
                  const SizedBox(height: 16),
                  Text(
                    'Багийн мэдээлэл',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: MyColors.greyBlue800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RegisterTeamCart(
                    teamData: controller.state.teamData,
                    isScrollAble: false,
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
            ),
          ),
          PaymentButton(
            priceText: '${Get.find<CompetitionDetailController>().state.gameData['registrationPrice']}',
            descText: 'Багийн хураамж',
          ),
        ],
      ),
    );
  }
}
