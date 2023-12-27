import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/my_routes.dart';
import '../../style/my_colors.dart';
import '../logic/vote_result_controller.dart';
import '../suite/player_list.dart';
import '../suite/vote_drawer.dart';

class VoteResultScreen extends StatefulWidget {
  const VoteResultScreen({Key? key}) : super(key: key);

  @override
  State<VoteResultScreen> createState() => _VoteResultScreenState();
}

class _VoteResultScreenState extends State<VoteResultScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int _previousTabIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    tabController.addListener(_listenToTabChanges);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _voteScaffoldKey = new GlobalKey<ScaffoldState>();

    return GetBuilder(
      init: VoteResultController(),
      builder: (VoteResultController controller) {
        return Obx(
          () {
            List<dynamic> _leaderboard() {
              switch (tabController.index) {
                case 0:
                  return controller.state.isMale.value ? controller.state.onlineVoteResultsMale : controller.state.onlineVoteResultsFemale;
                case 1:
                  return controller.state.isMale.value ? controller.state.arenaVoteResultsMale : controller.state.arenaVoteResultsFemale;
                case 2:
                  return controller.state.isMale.value ? controller.state.coachVoteResultsMale : controller.state.coachVoteResultsFemale;
                default:
                  return controller.state.onlineVoteResultsMale;
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
              body: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/ic_logo.png', scale: 10),
                          const SizedBox(width: 12),
                          Image.asset('assets/images/all_star.png', scale: 2),
                        ],
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
                      DefaultTabController(
                        length: 3,
                        child: TabBar(
                          controller: tabController,
                          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'GIP'),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.white,
                          dividerColor: Colors.white.withOpacity(0.5),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white.withOpacity(0.5),
                          tabs: [
                            Tab(text: 'Онлайн'),
                            Tab(text: 'Танхимын'),
                            Tab(text: 'Багийн'),
                          ],
                        ),
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
                      const SizedBox(height: 8),

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
                      const SizedBox(height: 16),

                      /// Your vote button
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

  void _listenToTabChanges() {
    if (_previousTabIndex != tabController.index) {
      _previousTabIndex = tabController.index;
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabController.removeListener(_listenToTabChanges);
    tabController.dispose();
    super.dispose();
  }
}
