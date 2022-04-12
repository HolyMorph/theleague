import 'package:flutter/material.dart';

///Апп-н хэмжээнд ашиглах уншиж буй харагдац
class MyLoadingWidget extends StatelessWidget {
  const MyLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
