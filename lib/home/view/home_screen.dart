import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../alert/alert_helper.dart';
import '../../components/app_back_button.dart';
import '../../route/my_routes.dart';
import '../../storage/local_storage.dart';
import '../../style/my_colors.dart';
import '../../utils/constants.dart';
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
        title: Text('Тоглогч сонгох'),
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
                            Image.asset('assets/images/ic_field.png'),
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
                                  Row(
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
                          Color(0xFF4C1C1A),
                          Color(0xFF272739),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                      onPressed: controller.state.totalQty.value > 0
                          ? () {
                              AlertHelper.showDialog(
                                message: controller.state.totalQty.value < 12
                                    ? 'Та саналаа бүрэн өгөөгүй байна, та санал өгөхдөө итгэлтэй байна уу?'
                                    : 'Та санал өгөхдөө итгэлтэй байна уу?',
                                onTap: () async => callFunction(),
                              );
                            }
                          : null,
                      child: Text(
                        'Саналаа өгөх',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'GIP'),
                      ),
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
}
