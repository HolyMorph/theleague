import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('I`m home screen'),
      ),
    );
  }
}
