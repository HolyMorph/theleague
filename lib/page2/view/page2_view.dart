import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/page2_controller.dart';

class Page2View extends GetView<Page2Controller> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          return Text('Counter number: ${controller.state.counter}');
        }),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: controller.increaseCounter,
              child: Icon(Icons.exposure_plus_1_rounded),
            ),
            SizedBox(width: 12),
            FloatingActionButton(
              onPressed: controller.decreaseCounter,
              child: Icon(Icons.exposure_minus_1_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
