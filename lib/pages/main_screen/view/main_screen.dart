import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';
import '../../home/view/home_screen.dart';
import '../../profile/view/profile_screen.dart';
import '../logic/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainScreenController(),
      builder: (MainScreenController controller) => Scaffold(
        body: PageView(
          controller: controller.state.pageController,
          children: [
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: ObxValue(
          (currIndex) => DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedFontSize: 0,
              selectedFontSize: 0,
              backgroundColor: Colors.white,
              selectedItemColor: MyColors.primaryColor,
              iconSize: 28,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.notifications),
                //   label: 'Search',
                // ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
              currentIndex: currIndex.value,
              onTap: (index) {
                currIndex.value = index;
                controller.state.pageController.animateToPage(
                  index,
                  duration: 200.milliseconds,
                  curve: Curves.decelerate,
                );
              },
            ),
          ),
          controller.state.bottomIndex,
        ),
      ),
    );
  }
}
