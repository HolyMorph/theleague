import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../route/my_routes.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/my_storage.dart';
import '../logic/coach_verify_controller.dart';

class CoachLoadingScreen extends GetView<CoachVerifyController> {
  CoachLoadingScreen({super.key});

  final RxString teamColor = RxString('');

  @override
  StatelessElement createElement() {
    teamColor.value = controller.state.teams.firstWhereOrNull((element) => element['code'] == controller.state.teamCode.value)['colorCode'];

    Future.delayed(const Duration(milliseconds: 3500), () {
      MyStorage().saveData('coachData', {
        'coachCode': '${controller.state.coachCode}',
        'teamCode': '${controller.state.teamCode}',
        'teamLogo': '${controller.state.teams.firstWhereOrNull((element) => element['code'] == controller.state.teamCode.value)['logoUrl']}',
        'teamColor': '${teamColor.value}',
      });

      Get.offNamed(MyRoutes.onboarding);
    });

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: MyColors.scaffoldBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  '${controller.state.teams.firstWhereOrNull((element) => element['code'] == controller.state.teamCode.value)['logoUrl']}?size=w150',
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 16),
            const Text(
              'Тавтай морилно уу.',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'GIP',
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearPercentIndicator(
                  percent: 1,
                  lineHeight: 10,
                  animation: true,
                  animationDuration: 3500,
                  fillColor: Colors.white,
                  backgroundColor: MyColors.backgroundColor,
                  progressColor: Color(
                    int.parse('0xFF${teamColor.substring(1, teamColor.value.length)}'),
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
