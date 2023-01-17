import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../page1/view/page1_view.dart';
import '../../page2/view/page2_view.dart';
import '../logic/home_controller.dart';
import '../state/home_state.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeState state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text('Page index: ${state.currentPage}');
        }),
      ),
      body: PageView(
        onPageChanged: controller.changePage,
        controller: state.pageController,
        children: [
          Page1View(),
          Page2View(),
        ],
      ),
    );
  }
}
