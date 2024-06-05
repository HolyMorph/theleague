import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../style/my_colors.dart';
import '../../competition_detail/suit/component/register_button.dart';
import '../../core/logic/core_controller.dart';
import '../../edit_team/suit/edit_team_routes.dart';
import '../logic/register_competition_controller.dart';
import '../suit/components/register_competition_appbar.dart';
import '../suit/components/register_team_cart.dart';
import '../suit/components/team_drop_down.dart';

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
                  RegisterCompetitionAppbar(coverUrl: controller.state.gameData['logo_rectangle']),
                  Expanded(
                    child: SingleChildScrollView(
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
                              isScrollAble: false,
                              onTap: controller.state.teamData['team']['owner_code'] == Get.find<CoreController>().state.meData['code']
                                  ? () {
                                      Get.toNamed(
                                        EditTeamRoutes.editTeamScreen + '/${controller.state.teamData['team']['code']}',
                                        parameters: {'from': Get.currentRoute},
                                      )?.then(
                                        (value) => controller.getTeamDetail(teamCode: controller.state.teamData['team']['code']),
                                      );
                                    }
                                  : null,
                            ),
                        ],
                      ).paddingAll(16),
                    ),
                  ),
                  RegisterButton(
                    title: 'Бүртгүүлэх',
                    onTap: () async {
                      if (controller.state.teamData.isEmpty) {
                        AlertHelper.showFlashAlert(
                          title: 'Уучлаарай',
                          message: 'Баг сонгоогүй байна',
                          status: FlashStatus.warning,
                        );
                      } else {
                        var (isSuccess, response) = await controller.myEntries();
                        if (!isSuccess) {
                          AlertHelper.showFlashAlert(
                            title: 'Алдаа',
                            message: response['message'] ?? 'Хүсэлт амжилтгүй',
                            status: FlashStatus.failed,
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
