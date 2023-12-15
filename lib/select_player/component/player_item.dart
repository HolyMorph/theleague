import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../style/my_colors.dart';

class PlayerItem extends StatelessWidget {
  final Function(String) onTap;
  final String playerFirstName;
  final String playerId;
  final String playerLastName;
  final String playerNumber;
  final String playerPosition;
  final Color teamColor;

  const PlayerItem({
    required this.playerFirstName,
    required this.playerId,
    required this.playerLastName,
    required this.playerNumber,
    required this.teamColor,
    required this.onTap,
    required this.playerPosition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RxString selectedCode = RxString('');

    return GestureDetector(
      onTap: () {
        selectedCode.value = selectedCode.value == playerId ? '' : playerId;
        onTap(playerId);
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
                    border: selectedCode.value == playerId ? Border.all(width: 1, color: teamColor) : null,
                    color: Color(0xFF3B3C4E),
                    boxShadow: [
                      selectedCode.value == playerId ? BoxShadow(offset: Offset(0, 1), blurRadius: 8, color: teamColor) : BoxShadow(),
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
                            colors: [teamColor, MyColors.primaryColor],
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          playerNumber,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                        child: Column(
                          children: [
                            Text(
                              playerFirstName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            Text(
                              playerLastName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              playerPosition,
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
                          color: selectedCode.value == playerId ? Color(0xFF4D5163).withOpacity(0.4) : Color(0xFF4D5163),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
                        ),
                        child: Text(
                          selectedCode.value == playerId ? 'Болих' : 'Сонгох',
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
              Divider(height: 1, thickness: 2, color: teamColor),
            ],
          ),
        ],
      ),
    );
  }
}
