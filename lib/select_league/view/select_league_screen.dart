import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route/my_routes.dart';
import '../component/select_league_item.dart';

class SelectLeagueScreen extends StatelessWidget {
  const SelectLeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Бүх оддын санал өгөх лигээ сонгоно уу.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SelectLeagueItem(
                    text: 'Эрэгтэй Дээд Лиг',
                    imagePath: 'assets/images/ic_mens_league.png',
                    onTap: () => Get.toNamed(MyRoutes.homeScreen),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: SelectLeagueItem(
                    text: 'Эмэгтэй Дээд Лиг',
                    imagePath: 'assets/images/ic_female_league.png',
                    onTap: () => Get.toNamed(MyRoutes.homeScreen),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/icons/ic_logo.png', width: 60, height: 60),
            const SizedBox(height: 4),
            Text(
              '@TheLeague 2023',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
