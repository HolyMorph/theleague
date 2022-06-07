import 'dart:math';

import 'package:flutter/material.dart';

/// Стандарт бус Alert харуулахад ашиглах жишээ виджет.
class DemoCustomAlertBody extends StatelessWidget {
  final bool isScrollable;
  const DemoCustomAlertBody({
    Key? key,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isScrollable)
          Column(
            children: List.filled(12, 1).map((e) => _bigContentItem()).toList(),
          ),
        Row(
          children: const [
            Text('Custom data 1'),
            Spacer(),
            Text(
              'Custom data 2',
              style: TextStyle(fontSize: 21, color: Colors.green),
            ),
          ],
        ),
        const Icon(Icons.style),
        const Icon(
          Icons.map,
          size: 48,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _bigContentItem() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Color.fromARGB(
        255,
        Random().nextInt(255),
        Random().nextInt(254),
        Random().nextInt(253),
      ),
      child: const Text('Big screen item'),
    );
  }
}
