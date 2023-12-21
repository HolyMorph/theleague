import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'change_player_item.dart';

class PlayersFilledItem extends StatelessWidget {
  final RxList<Map<String, dynamic>>? players;
  const PlayersFilledItem({required this.players, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Wrap(
        alignment: WrapAlignment.center,
        verticalDirection: VerticalDirection.up,
        spacing: 4,
        children: players!.map((element) => ChangePlayerItem(imageUrl: element['avatarUrl'])).toList(),
      ),
    );
  }
}
