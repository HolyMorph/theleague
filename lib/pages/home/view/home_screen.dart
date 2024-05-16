import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../style/my_colors.dart';
import '../logic/home_controller.dart';
import '../suit/component/home_appbar.dart';
import '../suit/home_competition_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          backgroundColor: MyColors.grey200,
          appBar: AppBar(
            backgroundColor: MyColors.primaryColor,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 30),
              child: HomeAppBar(),
            ),
          ),
          body: Column(
            children: [
              HomeCompetitionItem(),
            ],
          ).paddingAll(16),
        );
      },
    );
  }
}
