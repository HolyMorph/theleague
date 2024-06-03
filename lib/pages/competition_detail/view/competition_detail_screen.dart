import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../alert/alert_helper.dart';
import '../../../alert/flash_status.dart';
import '../../../components/schedule_information.dart';
import '../../../style/my_colors.dart';
import '../../competition_detail_parent/suit/component/parent_poll_item.dart';
import '../../register_competition/suit/register_competition_routes.dart';
import '../../theleague/the_league_splash/suit/league_splash_routes.dart';
import '../logic/competition_detail_controller.dart';
import '../suit/component/competition_header.dart';
import '../suit/component/register_button.dart';
import '../suit/component/sport_description_item.dart';

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
                  CompetitionHeader(
                    coverUrl: controller.state.gameData['eventType'] == 'poll'
                        ? controller.state.gameData['logo_square']
                        : controller.state.gameData['logo_rectangle'],
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
                          Text(
                            '${controller.state.gameData['description']}',
                            style: TextStyle(color: MyColors.grey500, fontSize: 12),
                          ),

                          const SizedBox(height: 24),
                          // RegisteredButton(),
                          // const SizedBox(height: 24),
                        ],
                      ).paddingSymmetric(horizontal: 16),
                    ),
                  ),
                  if (controller.state.gameData['hasAppRegistration'] == true && controller.state.gameData['registrationPrice'] > 0)
                    RegisterButton(
                      title: 'Оролцох',
                      onTap: () {
                        if (controller.state.isValidUserType) {
                          Get.toNamed(
                            '${RegisterCompetitionRoutes.registerCompetitionScreen}/${controller.state.gameCode.value}',
                          );
                        } else {
                          AlertHelper.showFlashAlert(
                            title: 'Уучлаарай',
                            message: 'Та тамирчнаар нэвтрэх шаардлагатай',
                            status: FlashStatus.warning,
                          );
                        }
                      },
                    ),
                ],
              ),
      ),
    );
  }
}
