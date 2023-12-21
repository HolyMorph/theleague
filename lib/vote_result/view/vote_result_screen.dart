import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/my_routes.dart';
import '../../style/my_colors.dart';
import '../logic/vote_result_controller.dart';
import '../suite/player_list.dart';

class VoteResultScreen extends StatelessWidget {
  const VoteResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VoteResultController(),
      builder: (VoteResultController controller) {
        return Obx(() {
          log('${controller.state.onlineVoteResults}');

          return Scaffold(
            backgroundColor: MyColors.scaffoldBackgroundColor,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/ic_logo.png',
                        height: 30,
                        width: 37,
                      ),
                      const SizedBox(width: 12),
                      Image.asset(
                        'assets/images/all_star.png',
                        height: 30,
                        width: 118,
                      ),
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
                  const SizedBox(height: 16),
                  DefaultTabController(
                    length: 3,
                    child: TabBar(
                      labelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.5),
                      tabs: [
                        Tab(text: 'Онлайн'),
                        Tab(text: 'Тоглолтын'),
                        Tab(text: 'Дасгалжуулагчийн'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Players Leaderboard
                  controller.state.isLoading.value
                      ? CircularProgressIndicator()
                      : PlayerList(
                          leaderboard: controller.state.onlineVoteResults,
                        ),
                  const SizedBox(height: 8),
                  const Divider(color: Color(0xff323232)),
                  const SizedBox(height: 8),

                  /// Vote button
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
                    onPressed: () {},
                    child: Text(
                      'Өгсөн саналаа харах',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // TabBarView(
                  //   children: [
                  //     Icon(Icons.flight, size: 350),
                  //     Icon(Icons.directions_transit, size: 350),
                  //     Icon(Icons.directions_car, size: 350),
                  //   ],
                  // ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
