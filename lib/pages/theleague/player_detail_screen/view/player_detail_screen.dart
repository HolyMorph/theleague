import 'package:flutter/material.dart';
import '../../../../components/mvp_player_cart.dart';
import '../../../../components/teams_match_cart.dart';

class PlayerDetailScreen extends StatelessWidget {
  const PlayerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TeamsMatchCart(),
          MvpPlayerCart(),
        ],
      ),
    );
  }
}
