import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../../competition_detail/suit/component/register_button.dart';
import '../logic/register_competition_controller.dart';
import '../suit/components/register_competition_appbar.dart';
import '../suit/components/register_team_cart.dart';
import '../suit/components/team_drop_down.dart';
import '../suit/register_competition_routes.dart';

class RegisterCompetitionTeam extends GetView<RegisterCompetitionController> {
  const RegisterCompetitionTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      body: Obx(
        () => controller.state.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.primaryColor),
              )
            : Column(
                children: [
                  RegisterCompetitionAppbar(),
                  Expanded(
                    child: Column(
                      children: [
                        TeamDropDown(
                          title: 'Баг cонгох',
                          isRequired: true,
                          onChanged: (team) async {
                            await controller.getTeamDetail(teamCode: team['code']);
                          },
                          selectedAbleList: controller.state.myTeams,
                        ),
                        const SizedBox(height: 24),
                        if (controller.state.teamData.isNotEmpty)
                          RegisterTeamCart(
                            teamData: controller.state.teamData,
                            isScrollAble: true,
                          ),
                      ],
                    ).paddingAll(16),
                  ),
                  RegisterButton(
                    title: 'Бүртгүүлэх',
                    onTap: () => Get.toNamed(RegisterCompetitionRoutes.registerCompetitionConfirmation),
                  ),
                ],
              ),
      ),
    );
  }
}
