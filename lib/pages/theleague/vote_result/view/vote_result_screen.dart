import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:get/get.dart';
import '../../../../route/my_routes.dart';
import '../../../../style/my_colors.dart';
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
            List<dynamic> _leaderboard() {
              switch (controller.state.tabIndex.value) {
                case 0:
                  return controller.state.onlineVoteResults;
                case 1:
                  return controller.state.arenaVoteResults;
                case 2:
                  return controller.state.coachVoteResults;
                case 3:
                  return controller.state.totalVoteResults;
                default:
                  return controller.state.onlineVoteResults;
              }
            }

            return Scaffold(
              key: _voteScaffoldKey,
              endDrawer: Drawer(
                elevation: 2,
                width: Get.size.width * 0.8,
                backgroundColor: MyColors.scaffoldBackgroundColor,
                child: VoteDrawer(
                  histories: controller.state.voteHistories,
                  gender: controller.state.isMale.value ? 'male' : 'female',
                ),
              ),
              backgroundColor: MyColors.scaffoldBackgroundColor,
              body: controller.state.initLoading.value
                  ? Center(child: CircularProgressIndicator(color: MyColors.secondaryColor))
                  : SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(height: 16),

                            XGestureDetector(
                              onLongPress: (event) {
                                Get.toNamed(MyRoutes.coachVerifyScreen);
                              },
                              longPressTimeConsider: 5000,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/icons/ic_logo.png', scale: 10),
                                  const SizedBox(width: 12),
                                  Image.asset('assets/images/all_star.png', scale: 2),
                                ],
                              ),
                            ),
                            const SizedBox(height: 32),
                            Text(
                              'Дээд Лиг 2024 Бүх оддын санал асуулга',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'GIP',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(width: 1, color: Color(0xff323232)),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () async {
                                        controller.state.isMale.value = true;
                                        await controller.getVoteResult();
                                        await controller.getVoteHistory();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        color: controller.state.isMale.value ? Color(0xff272739) : null,
                                        child: Center(
                                          child: Text(
                                            'Эрэгтэй Дээд Лиг',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'GIP',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () async {
                                        controller.state.isMale.value = false;
                                        await controller.getVoteResult();
                                        await controller.getVoteHistory();
                                      },
                                      child: Container(
                                        color: controller.state.isMale.value ? null : Color(0xff272739),
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            'Эмэгтэй Дээд Лиг',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'GIP',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TabBar(
                              controller: controller.state.tabController,
                              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'GIP'),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorColor: Colors.white,
                              isScrollable: controller.state.tabLength.value == 4 ? true : false,
                              tabAlignment: controller.state.tabLength.value == 4 ? TabAlignment.start : TabAlignment.fill,
                              dividerColor: Colors.white.withOpacity(0.5),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white.withOpacity(0.5),
                              onTap: (index) => controller.state.tabIndex.value = index,
                              tabs: controller.state.tabLength.value == 4
                                  ? [
                                      Tab(text: 'Онлайн'),
                                      Tab(text: 'Танхимын'),
                                      Tab(text: 'Багийн'),
                                      Tab(text: 'Нийт дүн'),
                                    ]
                                  : [
                                      Tab(text: 'Онлайн'),
                                      Tab(text: 'Танхимын'),
                                      Tab(text: 'Багийн'),
                                    ],
                            ),
                            const SizedBox(height: 20),

                            /// Players Leaderboard
                            if (controller.state.isLoading.value)
                              Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(color: MyColors.secondaryColor),
                                ),
                              )
                            else
                              Expanded(child: PlayerList(leaderboard: _leaderboard())),

                            const SizedBox(height: 8),
                            const Divider(color: Color(0xff323232)),
                            const SizedBox(height: 4),
                            controller.state.tabIndex.value == 3
                                ? const SizedBox()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.info_outline, size: 14, color: Colors.white),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${getTabTitle(index: controller.state.tabController.index)} санал бүх саналын ',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'GIP'),
                                      ),
                                      Text(
                                        controller.state.tabController.index == 1 ? '40%-ыг' : '30%-ыг',
                                        style:
                                            TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: MyColors.secondaryColor, fontFamily: 'GIP'),
                                      ),
                                      Text(
                                        ' эзэлнэ.',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'GIP'),
                                      ),
                                    ],
                                  ),
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
                                Get.toNamed(MyRoutes.onboarding);
                              },
                              child: Text(
                                'Санал өгөх',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'GIP',
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

  String getTabTitle({required int index}) {
    switch (index) {
      case 0:
        return 'Онлайн';
      case 1:
        return 'Танхимын';
      case 2:
        return 'Багийн';
      case 3:
        return 'Нийт дүн';
      default:
        return '';
    }
  }
}
