import 'package:flutter/material.dart';

import '../demo_strings.dart';

class CheckboxesWidget extends StatefulWidget {
  const CheckboxesWidget({Key? key}) : super(key: key);

  @override
  _CheckboxesWidgetState createState() => _CheckboxesWidgetState();
}

class _CheckboxesWidgetState extends State<CheckboxesWidget> {
  bool _isCheckBoxSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Энгийн үеийн харагдац
        Row(
          children: [
            Checkbox(
              value: _isCheckBoxSelected,
              onChanged: (value) {
                _isCheckBoxSelected = value ?? false;
                setState(() {});
              },
            ),
            const Text(DemoStrings.normalView),
          ],
        ),

        ///Идэвхгүй үеийн харагдац
        Row(
          children: [
            Checkbox(
              value: _isCheckBoxSelected,
              onChanged: null,
            ),
            const Text(DemoStrings.disableView),
          ],
        ),

        ///Загвар өөрчлөгдсөн үеийн харагдац
        Row(
          children: [
            Checkbox(
              value: _isCheckBoxSelected,
              onChanged: (value) {
                _isCheckBoxSelected = value ?? false;
                setState(() {});
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              activeColor: Colors.red,
              checkColor: Colors.yellow,
              side: const BorderSide(color: Colors.orange, width: 1),
            ),
            const Text(DemoStrings.customizedView),
          ],
        )
      ],
    );
  }
}
