import 'package:flutter/material.dart';
import 'package:mezorn_dummy/onboarding/splash_screen.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

///Апп эхлэхэд хийх тохиргоонууд
init() async {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}
