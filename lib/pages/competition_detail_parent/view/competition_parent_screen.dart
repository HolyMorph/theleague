import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../competition_detail/suit/component/competition_header.dart';
import '../../home/suit/home_competition_item.dart';
import '../logic/competition_parent_controller.dart';

class CompetitionParentScreen extends GetWidget<CompetitionParentController> {
  const CompetitionParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.state.isLoading.value
            ? Center(child: CircularProgressIndicator(color: MyColors.primaryColor))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CompetitionHeader(coverUrl: controller.state.coverImage.value),
                  const SizedBox(height: 24),
                  Text(
                    '${controller.state.gameName.value}',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shrinkWrap: true,
                      itemCount: controller.state.gameData['docs'].length,
                      itemBuilder: (context, index) {
                        return HomeCompetitionItem(data: controller.state.gameData['docs'][index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 8);
                      },
                    ).paddingSymmetric(horizontal: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
