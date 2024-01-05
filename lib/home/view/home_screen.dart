import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../components/app_back_button.dart';
import '../../route/my_routes.dart';
import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../../utils/constants.dart';
import '../component/coach_button.dart';
import '../component/select_item.dart';
import '../logic/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    if (Get.arguments != null) controller.state.selectedPlayers.value = Get.arguments;

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: LocalStorage.getData('coachData') != null && controller.state.type.value == 'coach'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      CachedNetworkImage(height: 30, width: 30, imageUrl: '${LocalStorage.getData('coachData')['teamLogo']}?size=w50'),
                      const SizedBox(width: 8),
                      Text('Тоглогч сонгох'),
                    ],
                  ),
                  const SizedBox(width: 80),
                ],
              )
            : Text('Тоглогч сонгох'),
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
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          'ҮНДЭСНИЙ ДЭЭД ЛИГ БҮХ ОДДЫН ТОГЛОЛТ'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontFamily: 'GIP',
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
                          'Та 12 хүртэлх тоглогчид санал өгөх боломжтой бөгөөд нэг байрлал дээр тус бүр 3 тоглогч сонгоно.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'GIP',
                            shadows: [
                              Shadow(
                                offset: Offset(5, 5),
                                blurRadius: 8.0,
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 40),
                                Image.asset('assets/images/ic_field.png', width: double.infinity),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  SelectItem(
                                    positionName: 'C',
                                    onTap: () {
                                      controller.title = 'C';
                                      Get.toNamed('${MyRoutes.selectPlayer}');
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  SelectItem(
                                    positionName: 'PG',
                                    onTap: () {
                                      controller.title = 'PG';
                                      Get.toNamed('${MyRoutes.selectPlayer}');
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SelectItem(
                                    positionName: 'F',
                                    onTap: () {
                                      controller.title = 'F';
                                      Get.toNamed('${MyRoutes.selectPlayer}');
                                    },
                                  ),
                                  SelectItem(
                                    positionName: 'G',
                                    onTap: () {
                                      controller.title = 'G';
                                      Get.toNamed('${MyRoutes.selectPlayer}');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                          controller.state.type.value == 'coach'
                              ? Color(
                                  int.parse(
                                    '0xFF${LocalStorage.getData('coachData')['teamColor'].substring(1, LocalStorage.getData('coachData')['teamColor'].length)}',
                                  ),
                                ).withOpacity(0.5)
                              : Color(0xFF4C1C1A),
                          Colors.transparent,
                        ],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        controller.state.type.value == 'coach'
                            ? CoachButton()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                                onPressed: controller.state.totalQty.value > 0 ? () async => await checkFunction() : null,
                                child: Text(
                                  'Саналаа өгөх',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'GIP'),
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

  Future<void> callFunction() async {
    Get.back();
    await LocalStorage.getData(Constants.TicketCode) != null ? controller.voteArena() : controller.voteOnline();
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
          controller.state.totalQty.value < 12
              ? 'Та саналаа бүрэн өгөөгүй байна, та санал өгөхдөө итгэлтэй байна уу?'
              : 'Та санал өгөхдөө итгэлтэй байна уу?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'GIP',
            color: Colors.white,
          ),
        ),
        onTap: () async => await callFunction(),
      );
    }
  }
}
