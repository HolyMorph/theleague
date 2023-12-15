import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../alert/alert_helper.dart';
import '../../alert/flash_status.dart';
import '../../components/app_back_button.dart';
import '../../components/app_button.dart';
import '../../style/my_colors.dart';
import '../component/player_item.dart';
import '../component/team_item.dart';
import '../logic/select_player_controller.dart';
import 'right_drawer.dart';

class SelectPlayerScreen extends GetView<SelectPlayerController> {
  const SelectPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        elevation: 2,
        width: Get.size.width * 0.8,
        child: RightDrawer(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(controller.getTitle()),
        leading: AppBackButton(),
        actions: [
          AppButton(
            child: Icon(Icons.shopping_bag_rounded, color: Colors.white),
            onTap: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 90,
                    child: ColoredBox(
                      color: Color(0xFF272739),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return TeamItem(
                            onTap: (teamCode) {},
                            iconPath: 'assets/icons/ic_ihc.png',
                            teamCode: 'ihc',
                            teamColor: Color(0xFFB06BFF),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ColoredBox(
                      color: MyColors.primaryColor,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 3 / 5,
                        ),
                        padding: EdgeInsets.all(16),
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PlayerItem(
                            playerFirstName: 'Сэтгэл',
                            playerId: 'быйбйы',
                            playerLastName: 'Жигмээ',
                            playerNumber: '3',
                            teamColor: Color(0xFFB06BFF),
                            playerPosition: 'Довтлогч / Хамгаалагч',
                            onTap: (playerId) {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              onPressed: () {
                AlertHelper.showFlashAlert(
                  title: 'Уучлаарай',
                  message: 'Тоглогчоо сонгоно уу !!!',
                  status: FlashStatus.failed,
                );
              },
              child: Text('Саналаа өгөх'),
            ),
          ),
        ],
      ),
    );
  }
}
