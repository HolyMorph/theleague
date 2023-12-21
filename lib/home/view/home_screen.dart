import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../components/app_back_button.dart';
import '../../components/app_button.dart';
import '../../route/my_routes.dart';
import '../../style/my_colors.dart';
import '../component/select_item.dart';
import '../logic/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Тоглогч сонгох'),
        leading: AppBackButton(),
        actions: [
          AppButton(child: Image.asset('assets/icons/ic_pack.png'), onTap: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: Column(
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
                        crossAxisAlignment: CrossAxisAlignment.sta,
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
            child: Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                onPressed: controller.state.totalQty.value > 0
                    ? () {
                        AlertHelper.showFlashAlert(
                          title: 'Уучлаарай',
                          message: 'Тоглогчоо сонгоно уу !!!',
                          status: FlashStatus.failed,
                        );
                      }
                    : null,
                child: Text('Саналаа өгөх'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
