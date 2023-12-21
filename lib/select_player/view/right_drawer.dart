import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/drawer_item.dart';
import '../logic/select_player_controller.dart';

class RightDrawer extends GetView<SelectPlayerController> {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).viewPadding.top + 24,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сонгосон тоглогчид',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.white.withOpacity(0.1), thickness: 1, height: 1),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            itemCount: controller.state.selectedPlayers.length,
            itemBuilder: (_, index) {
              return DrawerItem(player: controller.state.selectedPlayers[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8);
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
