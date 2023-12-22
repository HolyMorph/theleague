import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/logic/home_controller.dart';
import '../../style/my_colors.dart';
import '../component/drawer_item.dart';

class RightDrawer extends GetView<HomeController> {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).viewPadding.top + 24,
        horizontal: 16,
      ),
      color: MyColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сонгосон тоглогчид',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'GIP',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.white.withOpacity(0.1), thickness: 1, height: 1),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: controller.state.selectedPlayers.entries
                      .map(
                        (e) => DrawerItem(positionName: e.key, players: e.value),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
