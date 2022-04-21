import 'package:flutter/material.dart';

import '../collection_divider.dart';
import '../collection_title.dart';
import '../demo_strings.dart';

class TextButtonsWidget extends StatelessWidget {
  const TextButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: '[TextButton] загварууд'),

        ///Энгийн үеийн харагдац
        TextButton(
          onPressed: () {},
          child: Text(
            DemoStrings.normalView,
            // style: TextStyle(color: Get.theme.primaryColor),
          ),
        ),
        const CollectionDivider(),

        ///Идэвхдгүй үеийн харагдац
        const TextButton(
          onPressed: null,
          child: Text(DemoStrings.disableView),
        ),
        const CollectionDivider(),

        ///Загвар өөрчлөгдсөн үеийн харагдац
        TextButton(
          onPressed: () {},
          child: const Text(DemoStrings.customizedView),
          style: TextButton.styleFrom(
            primary: Colors.red,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
