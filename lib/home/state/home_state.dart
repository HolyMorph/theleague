import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeState {
  final PageController pageController = PageController();
  RxInt currentPage = RxInt(0);
}
