import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_player_item.dart';

class PlayersFilledItem extends StatelessWidget {
  final RxList<Map<String, dynamic>>? players;
  const PlayersFilledItem({required this.players, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Wrap(
        alignment: WrapAlignment.center,
        verticalDirection: VerticalDirection.up,
        spacing: 4,
        children: [
          if (players!.length < 2 && players!.length > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/ic_add.png', scale: 3),
                const SizedBox(width: 4),
                Image.asset('assets/icons/ic_add.png', scale: 3),
              ],
            ),
          for (var player in players!) ChangePlayerItem(imageUrl: player['avatarUrl'] ?? '', teamCode: player['teamCode'] ?? ''),
          if (players!.length < 3 && players!.length > 1) Image.asset('assets/icons/ic_add.png', scale: 3),
        ],
      ),
    );
  }
}
