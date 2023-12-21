import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/home_controller.dart';
import 'player_bottomsheet_item.dart';
import 'players_filled_item.dart';

class SelectItem extends GetView<HomeController> {
  final VoidCallback onTap;
  final String positionName;
  const SelectItem({required this.positionName, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.state.selectedPlayers['${positionName}']!.length < 3
            ? onTap()
            : Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: Color(0xFF3B3C4E),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${controller.getPositionName(position: positionName)}:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PlayerBottomSheetItem(position: positionName, players: controller.state.selectedPlayers['${positionName}']!),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4D5163)),
                        onPressed: () => Get.back(),
                        child: Text('Хаах'),
                      ),
                    ],
                  ),
                ),
              );
      },
      child: Obx(
        () => Column(
          children: [
            controller.state.selectedPlayers['${positionName}']!.isEmpty
                ? Image.asset('assets/icons/ic_selector.png', width: 40)
                : PlayersFilledItem(players: controller.state.selectedPlayers['${positionName}']),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xFF393C50).withOpacity(0.8),
              ),
              child: Text(
                controller.getPositionName(position: positionName),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
