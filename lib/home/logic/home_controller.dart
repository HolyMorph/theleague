import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../state/home_state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  void changePage(int page, {bool animatePage = false}) {
    if (state.currentPage.value != page) {
      state.currentPage.value = page;
    }
    if (animatePage) {
      state.pageController.animateToPage(page, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    }
  }
}
