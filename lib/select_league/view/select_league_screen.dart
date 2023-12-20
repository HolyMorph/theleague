import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_back_button.dart';
import '../../route/my_routes.dart';
import '../component/select_league_item.dart';

class SelectLeagueScreen extends StatelessWidget {
  const SelectLeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Лиг сонгох'),
        leading: AppBackButton(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.white.withOpacity(0.1), height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              'Бүх оддын санал өгөх лигээ сонгоно уу.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 36),
            SelectLeagueItem(
              text: 'Эрэгтэй Дээд Лиг',
              imagePath: 'assets/images/ic_male.png',
              onTap: () => Get.toNamed(MyRoutes.homeScreen),
            ),
            const SizedBox(height: 16),
            SelectLeagueItem(
              text: 'Эмэгтэй Дээд Лиг',
              imagePath: 'assets/images/ic_female.png',
              onTap: () => Get.toNamed(MyRoutes.homeScreen),
            ),
            const Spacer(),
            Image.asset('assets/icons/ic_logo.png', width: 60, height: 60),
            const SizedBox(height: 4),
            Text(
              '@Duiz 2023',
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
