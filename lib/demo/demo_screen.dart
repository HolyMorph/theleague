import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding/splash_screen.dart';
import 'my_style_guide.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(const MyStyleGuide());
              },
              child: const Text('My Style Guide'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.to(const SplashScreen());
              },
              child: const Text('Start App'),
            ),
          ],
        ),
      ),
    );
  }
}
