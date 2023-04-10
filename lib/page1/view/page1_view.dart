import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/logic/home_controller.dart';
import '../logic/page1_controller.dart';

class Page1View extends GetWidget<Page1Controller> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('page 1 --> Swipe me to left'),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              homeController.changePage(1, animatePage: true);
            },
            child: Text('Show next page'),
          ),
        ],
      ),
    );
  }
}
