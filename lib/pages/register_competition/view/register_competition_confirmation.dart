import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../../../style/style_export.dart';
import '../../../utils/game_type.dart';
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.white, size: 32),
          onPressed: () => controller.state.gameType.value == GameType.Individual ? Get.close(2) : Get.back(),
        ),
      ),
      body: PopScope(
        canPop: false,
        child: RefreshIndicator(
          onRefresh: () async {
            controller.checkInvoice();
          },
          child: ObxValue(
            (loading) => loading.value
                ? const Center(child: CircularProgressIndicator(color: MyColors.primaryColor))
                : CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  const CompetitionInfo(),
                                  const SizedBox(height: 16),
                                  const PersonalInfo(),
                                  const SizedBox(height: 16),
                                  if (controller.state.gameType == GameType.Team)
                                    Text(
                                      'Багийн мэдээлэл',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.greyBlue800,
                                      ),
                                    ),
                                  const SizedBox(height: 8),
                                  if (controller.state.gameType == GameType.Team)
                                    RegisterTeamCart(
                                      teamData: controller.state.teamData,
                                      isScrollAble: false,
                                    ),
                                  const SizedBox(height: 8),
                                ],
                              ).paddingSymmetric(horizontal: 16),
                            ),
                            PaymentButton(
                              priceText: '${controller.state.gameData['registrationPrice']}',
                              descText: '${controller.state.gameData['registrationText'] ?? 'Хураамж'}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
            controller.state.isLoading,
          ),
        ),
      ),
    );
  }
}
