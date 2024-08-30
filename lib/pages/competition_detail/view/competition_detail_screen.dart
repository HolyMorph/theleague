import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../components/schedule_information.dart';
import '../../../style/my_colors.dart';
import '../../../utils/basic_utils.dart';
import '../../../utils/fa_icon.dart';
import '../../../utils/qr_scanner.dart';
import '../../competition_detail_parent/suit/component/parent_poll_item.dart';
import '../../core/logic/core_controller.dart';
import '../../judge/suit/judge_routes.dart';
import '../../register_competition/suit/register_competition_routes.dart';
import '../../theleague/the_league_splash/suit/league_splash_routes.dart';
import '../logic/competition_detail_controller.dart';
import '../suit/component/competition_header.dart';
import '../suit/component/mandate_bottomsheet.dart';
import '../suit/component/register_button.dart';
import '../suit/component/sport_description_item.dart';
import '../suit/component/ticket_button.dart';

class CompetitionDetailScreen extends GetView<CompetitionDetailController> {
  const CompetitionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.state.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.primaryColor),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CompetitionHeader(
                        coverUrl: controller.state.gameData['eventType'] == 'poll'
                            ? controller.state.gameData['logo_square']
                            : controller.state.gameData['logo_rectangle'],
                      ),
                      if (controller.state.isMeJudge.value)
                        Positioned(
                          right: 16,
                          top: MediaQuery.of(context).viewPadding.top,
                          child: Material(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.primaryColor,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () async {
                                String? code = await Get.to(() => QrScanner());
                                if (code != null) {
                                  var (isSuccess, response) = await controller.checkJudge(code: code);
                                  if (isSuccess) {
                                    Get.toNamed(
                                      JudgeRoutes.judgeScreen,
                                      arguments: {'entry': response['result']},
                                      parameters: {'gameCode': '${response['result']['game_code']}'},
                                    );
                                  } else {
                                    AlertHelper.showFlashAlert(
                                      title: 'Алдаа',
                                      message: response['message'] ?? 'Хүсэлт амжилтгүй',
                                      status: FlashStatus.failed,
                                    );
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.qr_code_2_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            controller.state.gameData['name'],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Зохион байгуулагч: ${controller.state.gameData['organizerName']}',
                            style: TextStyle(color: MyColors.grey500),
                          ),
                          const SizedBox(height: 16),

                          ///Sport category
                          SportDescriptionItem(
                            category: controller.state.gameData['meta']['gameCategoriesDictionary']
                                    ['${controller.state.gameData['gameCategories']}'] ??
                                '${'${controller.state.gameData['gameCategories']}'}',
                          ),
                          const SizedBox(height: 24),
                          ScheduleInformation(
                            location: '${controller.state.gameData['address']['name']}',
                            date:
                                '${DateFormat('MM сарын dd').format(DateTime.parse('${controller.state.gameData['startDate']}'))} - ${DateFormat('MM сарын dd').format(DateTime.parse('${controller.state.gameData['endDate']}'))}',
                            time: '${controller.state.gameData['timeString']}',
                          ),
                          // const SizedBox(height: 24),
                          // ScoreboardScheduleItem(),
                          const SizedBox(height: 24),
                          if (controller.state.gameData['eventType'] == 'poll')
                            Column(
                              children: [
                                for (var event in controller.state.gameData['children'])
                                  ParentPollItem(
                                    onTap: () {
                                      Get.toNamed(
                                        LeagueSplashRoutes.leagueSplashScreen + '/${event['gameCategories']}/${event['code']}/${event['gender']}',
                                      );
                                    },
                                    text: '${controller.state.gameData['meta']['genderDictionary']['${event['gender']}']} санал өгөх',
                                  ).marginOnly(bottom: 8),
                                const SizedBox(height: 8),
                              ],
                            ),
                          Text(
                            'Дэлгэрэнгүй мэдээлэл',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          BasicUtils().description(text: '${controller.state.gameData['description']}'),
                          const SizedBox(height: 24),
                          if (controller.state.gameData['allowMultipleRegistration'] != null &&
                              controller.state.gameData['allowMultipleRegistration'] &&
                              (controller.state.gameData['gameType'] == 'team'))
                            InkWell(
                              onTap: () async {
                                if (await controller.state.gameData['allowedUserTypes']
                                    .any((type) => type == controller.coreController.state.meData['type'])) {
                                  dynamic refresh = await Get.toNamed(
                                    '${RegisterCompetitionRoutes.registerCompetitionScreen}/${controller.state.gameCode.value}',
                                    parameters: {'from': Get.currentRoute},
                                  );
                                  if (refresh == null) controller.getGameDetail();
                                } else {
                                  AlertHelper.showFlashAlert(
                                    title: 'Уучлаарай',
                                    message: 'Та тамирчнаар нэвтрэх шаардлагатай',
                                    status: FlashStatus.warning,
                                  );
                                }
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  children: [
                                    Text(
                                      FaIcon.circlePlus,
                                      style: FaIcon.regular().copyWith(
                                        color: MyColors.primaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Бусдийн өмнөөс бүртгүүлэх',
                                      style: TextStyle(
                                        color: MyColors.primaryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(Icons.chevron_right, color: Colors.black, size: 28),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(height: 16),

                          // RegisteredButton(),
                          // const SizedBox(height: 24),
                        ],
                      ).paddingSymmetric(horizontal: 16),
                    ),
                  ),
                  if (controller.state.isRegistered.value)
                    TicketButton(
                      onTap: () {
                        Get.bottomSheet(
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          MandateBottomSheet(
                            mandates: controller.state.mandates,
                            gameType:
                                '${controller.state.gameData['meta']['gameCategoriesDictionary']['${controller.state.gameData['gameCategories']}']}',
                            gameName: '${controller.state.gameData['name']}',
                            date: '${controller.state.gameData['startDate']}',
                            orgLogo: '${controller.state.gameData['logo_square']}',
                          ),
                        );
                      },
                      btnText: 'Мандат',
                      faIcon: FaIcon.user_square,
                    ),
                  if (!controller.state.isRegistered.value &&
                      controller.state.gameData['hasAppRegistration'] == true &&
                      controller.state.gameData['registrationPrice'] > 0)
                    RegisterButton(
                      title: 'Оролцох',
                      onTap: () async {
                        if (controller.state.gameData['registrationRequired'] == true && !Get.find<CoreController>().state.isLoggedIn.value) {
                          BasicUtils().notLoggedIn(route: Get.currentRoute);

                          return;
                        }
                        if (await controller.state.gameData['allowedUserTypes']
                                .any((type) => type == controller.coreController.state.meData['type']) ||
                            (Get.find<CoreController>().state.isLoggedIn.value && controller.state.gameData['status'] == 20)) {
                          dynamic refresh = await Get.toNamed(
                            '${RegisterCompetitionRoutes.registerCompetitionScreen}/${controller.state.gameCode.value}',
                            parameters: {'from': Get.currentRoute},
                          );
                          if (refresh == null) controller.getGameDetail();
                        } else {
                          if (controller.state.gameData['status'] != 20 && Get.find<CoreController>().state.isLoggedIn.value) {
                            AlertHelper.showFlashAlert(
                              title: 'Уучлаарай',
                              message: 'Бүртгэл эхлээгүй байна',
                              status: FlashStatus.warning,
                            );
                          } else {
                            AlertHelper.showFlashAlert(
                              title: 'Уучлаарай',
                              message: 'Та тамирчнаар нэвтрэх шаардлагатай',
                              status: FlashStatus.warning,
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
