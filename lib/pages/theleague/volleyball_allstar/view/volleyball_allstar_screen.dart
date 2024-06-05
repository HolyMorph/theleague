import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../components/app_back_button.dart';
import '../../../../route/my_routes.dart';
import '../../../../style/my_colors.dart';
import '../../all_star_home/logic/all_star_controller.dart';
import '../suit/component/selected_players.dart';

class VolleyBallAllStarScreen extends GetView<AllStarController> {
  const VolleyBallAllStarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.theLeagueColor,
      appBar: AppBar(
        backgroundColor: MyColors.theLeagueColor,
        automaticallyImplyLeading: false,
        title: Text('Тоглогч сонгох'),
        centerTitle: true,
        leading: AppBackButton(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: Obx(
        () => controller.state.isLoading.value
            ? Center(
                child: CircularProgressIndicator(color: MyColors.secondaryColor),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          'Монголын Волейболын Холбоо',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 8.0,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'ВОЛЕЙБОЛ ФЕСТИВАЛ 2024'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 8.0,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Та 14 хүртэлх тоглогчид санал өгөх боломжтой',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 8.0,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 40),
                                Image.asset('assets/images/ic_volleyball_field.png', width: double.infinity),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    SelectedPlayers(
                                      maxPlayer: 4,
                                      positionName: 'MB',
                                      onTap: () {
                                        controller.title = 'MB';
                                        Get.toNamed('${MyRoutes.selectPlayer}');
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    SelectedPlayers(
                                      maxPlayer: 2,
                                      positionName: 'L',
                                      onTap: () {
                                        controller.title = 'L';
                                        Get.toNamed('${MyRoutes.selectPlayer}');
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(height: 50),
                                    SelectedPlayers(
                                      maxPlayer: 2,
                                      positionName: 'OH',
                                      onTap: () {
                                        controller.title = 'OH';
                                        Get.toNamed('${MyRoutes.selectPlayer}');
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SelectedPlayers(
                                      maxPlayer: 4,
                                      positionName: 'OPH',
                                      onTap: () {
                                        controller.title = 'OPH';
                                        Get.toNamed('${MyRoutes.selectPlayer}');
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    SelectedPlayers(
                                      maxPlayer: 2,
                                      positionName: 'S',
                                      onTap: () {
                                        controller.title = 'S';
                                        Get.toNamed('${MyRoutes.selectPlayer}');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SelectedPlayers(
                          maxPlayer: 2,
                          positionName: 'CO',
                          onTap: () {
                            controller.title = 'CO';
                            Get.toNamed('${MyRoutes.selectPlayer}');
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          MyColors.secondaryColor.withOpacity(0.5),
                          Colors.transparent,
                        ],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            surfaceTintColor: Colors.transparent,
                            backgroundColor: MyColors.secondaryColor,
                            disabledBackgroundColor: MyColors.unselectedWidgetColor.withOpacity(0.5),
                          ),
                          onPressed: controller.state.totalQty.value > 0 ? () async => await checkFunction() : null,
                          child: Text(
                            'Саналаа өгөх',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> checkFunction() async {
    if (!controller.state.isCanVote.value) {
      AlertHelper.showFlashAlert(
        title: 'Уучлаарай',
        message: 'Таны санал өгөх хугацаа идэвхтэй болоогүй байна.',
        status: FlashStatus.failed,
      );

      return;
    } else {
      AlertHelper.showDialog(
        message: Text(
          controller.state.totalQty.value < 14
              ? 'Та саналаа бүрэн өгөөгүй байна, та санал өгөхдөө итгэлтэй байна уу?'
              : 'Та санал өгөхдөө итгэлтэй байна уу?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        onTap: () async {
          Get.back();
          controller.voteOnline();
        },
      );
    }
  }
}
