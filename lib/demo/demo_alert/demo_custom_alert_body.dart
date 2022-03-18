import 'package:flutter/material.dart';

///Стандарт бус Alert харуулахад ашиглах жишээ виджет
class DemoCustomAlertBody extends StatelessWidget {
  const DemoCustomAlertBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
}
