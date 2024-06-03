import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../alert/alert_helper.dart';
import '../../../../alert/flash_status.dart';
import '../../../../components/app_back_button.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_storage.dart';
import '../../all_star_home/logic/all_star_controller.dart';
import '../component/empty_widget.dart';
import '../component/player_archive_button.dart';
import '../component/player_item.dart';
import '../component/team_item.dart';
import 'right_drawer.dart';

class SelectPlayerScreen extends GetView<AllStarController> {
  const SelectPlayerScreen({super.key});

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller.state.playerLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 500)).then((value) {
        controller.selectedTeamCode = controller.state.teams.first['code'];
        controller.setPlayersPosition();
        controller.calculateTotalQty();
      });
      controller.state.playerLoading.value = false;
    });

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors.theLeagueColor,
      endDrawer: Drawer(
        backgroundColor: MyColors.theLeagueColor,
        elevation: 2,
        width: Get.size.width * 0.8,
        child: RightDrawer(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(controller.getTitle()),
        backgroundColor: MyColors.theLeagueColor,
        leading: AppBackButton(),
        actions: [
          PlayerArchiveButton(
            child: Icon(Icons.people_alt, color: Colors.white),
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
      body: Obx(
        () => controller.state.playerLoading.value
            ? Center(child: CircularProgressIndicator(color: MyColors.secondaryColor))
            : Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: double.infinity,
                          width: 90,
                          color: Color(0xFF272739),
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            itemCount: controller.state.teams.length,
                            itemBuilder: (_, index) {
                              return TeamItem(
                                onTap: (teamCode) {
                                  controller.setPlayersPosition();
                                },
                                iconUrl: controller.state.teams[index]['logoUrl'],
                                teamCode: controller.state.teams[index]['code'],
                                teamColor: controller.state.teams[index]['colorCode'],
                                selectedPlayer: controller.getTeamPlayersQty(teamCode: controller.state.teams[index]['code']),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                          ),
                        ),
                        Expanded(
                          child: ColoredBox(
                            color: MyColors.theLeagueColor,
                            child: Obx(
                              () => controller.state.teamPlayers.isNotEmpty
                                  ? GridView.builder(
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 8.0,
                                        crossAxisSpacing: 16.0,
                                        childAspectRatio: 3 / 5,
                                      ),
                                      padding: EdgeInsets.all(16),
                                      itemCount: controller.state.teamPlayers.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return PlayerItem(
                                          player: controller.state.teamPlayers[index],
                                          maxPlayer: controller.getPositionMaxPlayer(controller.state.title),
                                          teamColor: controller.state.teams.firstWhere(
                                            (element) => element['code'].toLowerCase() == controller.state.selectedTeamCode.value.toLowerCase(),
                                          )['colorCode'],
                                          onTap: (player) => addRemoveFunction(player: player),
                                        );
                                      },
                                    )
                                  : EmptyWidget(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'Сонголтоо харах',
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

  void addRemoveFunction({required Map<String, dynamic> player}) {
    Map<String, dynamic>? _existPlayer =
        controller.state.selectedPlayers['${controller.state.title}']?.firstWhereOrNull((element) => element['_id'] == player['_id']);

    if (_existPlayer == null) {
      if (controller.state.selectedPlayers['${controller.state.title}']!.length < controller.getPositionMaxPlayer('${controller.state.title}')) {
        controller.state.selectedPlayers['${controller.state.title}']?.add(player);
      } else {
        AlertHelper.showFlashAlert(
          title: 'Уучлаарай',
          message: 'Энэ байрлал дээр ${controller.getPositionMaxPlayer('${controller.state.title}')} тоглогч сонгох боломжтой',
          status: FlashStatus.failed,
        );
      }
    } else {
      controller.state.selectedPlayers['${controller.state.title}']?.remove(player);
    }

    controller.calculateTotalQty();
    MyStorage().saveData(controller.state.gender == 'male' ? Constants.PlayersMale : Constants.PlayersFemale, controller.state.selectedPlayers);
  }
}
