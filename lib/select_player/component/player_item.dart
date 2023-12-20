import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../style/my_colors.dart';
import '../logic/select_player_controller.dart';

class PlayerItem extends GetView<SelectPlayerController> {
  final Function(Map<String, dynamic>) onTap;
  final Map<String, dynamic> player;
  final RxString selectedCode = RxString('');
  PlayerItem({required this.player, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedCode.value = controller.state.selectedPlayers.length < 3
            ? selectedCode.value == player['playerId']
                ? ''
                : player['playerId']
            : '';
        onTap(player);
      },
      child: Stack(
        children: [
          ObxValue(
            (_) => Column(
              children: [
                const SizedBox(height: 36),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        selectedCode.value == player['playerId'] ? Border.all(width: 1, color: Color(int.parse('0xFF${player['teamColor']}'))) : null,
                    color: Color(0xFF3B3C4E),
                    boxShadow: [
                      selectedCode.value == player['playerId']
                          ? BoxShadow(offset: Offset(0, 1), blurRadius: 8, color: Color(int.parse('0xFF${player['teamColor']}')))
                          : BoxShadow(),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                          gradient: RadialGradient(
                            focal: Alignment.bottomCenter,
                            radius: 1.35,
                            colors: [Color(int.parse('0xFF${player['teamColor']}')), MyColors.primaryColor],
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          player['playerNumber'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                        child: Column(
                          children: [
                            Text(
                              player['playerFirstName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            Text(
                              player['playerLastName'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              player['playerPosition'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: selectedCode.value == player['playerId'] ? Color(0xFF4D5163).withOpacity(0.4) : Color(0xFF4D5163),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                        ),
                        child: Text(
                          selectedCode.value == player['playerId'] ? 'Болих' : 'Сонгох',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            selectedCode,
          ),
          Column(
            children: [
              Image.asset('assets/images/ic_player.png'),
              Divider(
                height: 1,
                thickness: 2,
                color: Color(int.parse('0xFF${player['teamColor']}')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
