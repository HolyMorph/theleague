import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../../../style/style_export.dart';
import '../../../utils/fa_icon.dart';
import '../../create_team/suit/create_team_routes.dart';
import '../logic/my_teams_controller.dart';
import '../suit/component/my_team_cart.dart';

class MyTeamsScreen extends GetView<MyTeamsController> {
  const MyTeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Миний багууд',
          style: TextStyle(fontSize: 18),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight - 50),
          child: const SizedBox(),
        ),
      ),
      body: Obx(
        () => controller.state.isLoading.value
            ? const Center(child: CircularProgressIndicator(color: MyColors.primaryColor))
            : Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(width: 1, color: MyColors.grey300),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(CreateTeamRoutes.createTeamScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FaIcon.user_group,
                          style: FaIcon.regular().copyWith(color: MyColors.primaryColor),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Баг нэмэх',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: MyColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.state.myTeams['docs'].length,
                    itemBuilder: (context, index) {
                      return MyTeamCart(team: controller.state.myTeams['docs'][index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                  ),
                ],
              ).paddingAll(16),
      ),
    );
  }
}
