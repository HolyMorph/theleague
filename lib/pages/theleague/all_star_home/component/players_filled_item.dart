import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_player_item.dart';

class PlayersFilledItem extends StatelessWidget {
  final RxList<Map<String, dynamic>>? players;
  final int maxPlayer;
  const PlayersFilledItem({required this.players, required this.maxPlayer, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Wrap(
        alignment: WrapAlignment.center,
        verticalDirection: VerticalDirection.down,
        spacing: 4,
        children: [
          for (var player in players!) ChangePlayerItem(imageUrl: player['avatarUrl'] ?? '', teamCode: player['teamCode'] ?? ''),
          for (int empty = 0; empty < (maxPlayer - players!.length); empty++) Image.asset('assets/icons/ic_add.png', height: 44, width: 44),
        ],
      ),
    );
  }
}
