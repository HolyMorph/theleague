import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../volleyball_allstar/suit/volleyball_allstar_routes.dart';
import '../logic/vote_result_controller.dart';
import '../suite/player_list.dart';
import '../suite/vote_drawer.dart';

class VoteResultScreen extends StatelessWidget {
  const VoteResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _voteScaffoldKey = new GlobalKey<ScaffoldState>();

    return GetBuilder(
      init: VoteResultController(),
      builder: (VoteResultController controller) {
        return Obx(
          () {
            return Scaffold(
              key: _voteScaffoldKey,
              endDrawer: Drawer(
                elevation: 2,
                width: Get.size.width * 0.8,
                backgroundColor: MyColors.theLeagueColor,
                child: VoteDrawer(
                  histories: controller.state.voteHistories,
                  gender: controller.state.gender.value,
                ),
              ),
              backgroundColor: MyColors.theLeagueColor,
              body: controller.state.initLoading.value
                  ? Center(child: CircularProgressIndicator(color: MyColors.secondaryColor))
                  : SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: Get.size.width,
                              child: Stack(
                                children: [
                                  Center(child: Image.asset('assets/images/ic_volleyball_cover.png', scale: 2)),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: GestureDetector(
                                      onTap: () => Get.back(),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'ВОЛЕЙБОЛ ФЕСТИВАЛ 2024 ${controller.state.gender.value == 'male' ? 'Эрэгтэй' : 'Эмэгтэй'} санал асуулга'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Divider(color: Color(0xff323232)),

                            /// Players Leaderboard
                            if (controller.state.isLoading.value)
                              Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(color: MyColors.secondaryColor),
                                ),
                              )
                            else
                              Expanded(
                                child: PlayerList(leaderboard: controller.state.onlineVoteResults),
                              ),

                            const SizedBox(height: 8),
                            const Divider(color: Color(0xff323232)),
                            const SizedBox(height: 12),

                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return MyColors.secondaryColor;
                                  },
                                ),
                              ),
                              onPressed: () {
                                Get.toNamed(
                                  VolleyBallAllStarRoutes.volleyBallAllStarScreen +
                                      '/${controller.state.gender.value}' +
                                      '/${controller.state.category}' +
                                      '/${controller.state.gameCode.value}',
                                );
                              },
                              child: Text(
                                'Санал өгөх',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                    return Color(0xff272739);
                                  },
                                ),
                              ),
                              onPressed: () {
                                _voteScaffoldKey.currentState!.openEndDrawer();
                              },
                              child: Text(
                                'Өгсөн саналаа харах',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'GIP'),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Image.asset(
                              'assets/images/ic_logo_small.png',
                              height: 30,
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
