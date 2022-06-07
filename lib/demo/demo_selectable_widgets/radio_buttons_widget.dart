import 'package:flutter/material.dart';

import '../demo_strings.dart';

class RadioButtonsWidget extends StatefulWidget {
  const RadioButtonsWidget({Key? key}) : super(key: key);

  @override
  _RadioButtonsWidgetState createState() => _RadioButtonsWidgetState();
}

class _RadioButtonsWidgetState extends State<RadioButtonsWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Энгийн үеийн харагдац.
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: _index,
              onChanged: (value) {
                _index = (value is int) ? value : 0;
                setState(() {});
              },
            ),
            const Text(DemoStrings.normalView),
          ],
        ),

        /// Идвэхгүй үеийн харагдац.
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _index,
              onChanged: null,
            ),
            const Text(DemoStrings.disableView),
          ],
        ),

        /// Загвар өөрчлөгдсөн үеийн харагдац.
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: _index,
              onChanged: (value) {
                _index = (value is int) ? value : 0;
                setState(() {});
              },
              hoverColor: Colors.orange,
              overlayColor: MaterialStateProperty.all(Colors.orange.withOpacity(0.2)),
              fillColor: MaterialStateProperty.all(Colors.green),
            ),
            const Text(DemoStrings.customizedView),
          ],
        ),
      ],
    );
  }
}
