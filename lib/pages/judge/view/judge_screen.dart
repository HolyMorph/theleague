import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../logic/judge_controller.dart';
import '../suit/comonents/judge_check_button.dart';
import '../suit/comonents/judge_competition_info.dart';
import '../suit/comonents/judge_member_cart.dart';
import '../suit/comonents/person_info.dart';

class JudgeScreen extends GetWidget<JudgeController> {
  const JudgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Оролцогчийн мэдээлэл',
          style: TextStyle(fontSize: 14),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 50),
          child: const SizedBox(),
        ),
      ),
      body: Container(
        child: Obx(
          () => controller.state.isLoading.value
              ? const Center(child: CupertinoActivityIndicator(color: MyColors.primaryColor))
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const JudgeCompetitionInfo(),
                            const SizedBox(height: 16),
                            Text(
                              'Оролцогчийн хувийн мэдээлэл',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: MyColors.grey700,
                              ),
                            ),
                            const SizedBox(height: 16),

                            ///Personal Info
                            PersonInfo(),
                            const SizedBox(height: 16),
                            if (controller.state.gameData['gameType'] == 'team')
                              Column(
                                children: [
                                  Text(
                                    'Багийн мэдээлэл',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.grey700,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          blurRadius: 8,
                                          color: MyColors.grey200,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: controller.state.entryData['teamLogo'],
                                          alignment: Alignment.center,
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: 50,
                                            width: 50,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(width: 1, color: MyColors.grey300),
                                            ),
                                          ),
                                          placeholder: (context, url) => Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 50,
                                            child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                                          ),
                                          errorWidget: (context, url, error) => Icon(
                                            Icons.error_outline,
                                            size: 30,
                                            color: MyColors.primaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            '${controller.state.entryData['teamName']}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ).paddingAll(8),
                                  ),
                                  const SizedBox(height: 16),
                                  ListView.separated(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    itemCount: controller.state.entryData['details'].length,
                                    itemBuilder: (context, index) {
                                      return JudgeMemberCart(player: controller.state.entryData['details'][index]);
                                    },
                                    separatorBuilder: (BuildContext context, int index) {
                                      return const SizedBox(height: 8);
                                    },
                                  ),
                                ],
                              ),
                          ],
                        ).paddingAll(16),
                      ),
                    ),
                    const JudgeCheckButton(),
                  ],
                ),
        ),
      ),
    );
  }
}
