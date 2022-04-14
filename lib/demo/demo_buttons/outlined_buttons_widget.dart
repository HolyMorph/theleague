import 'package:flutter/material.dart';

import '../collection_divider.dart';
import '../collection_title.dart';
import '../demo_strings.dart';

class OutlinedButtonsWidget extends StatelessWidget {
  const OutlinedButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: '[OutlinedButton] загварууд'),

        ///Энгийн үеийн харагдац
        OutlinedButton(
          onPressed: () {},
          child: const Text(DemoStrings.normalView),
        ),
        const CollectionDivider(),

        ///Идэвхгүй үеийн харагдац
        const OutlinedButton(
          onPressed: null,
          child: Text(DemoStrings.disableView),
        ),
        const CollectionDivider(),

        ///Загвар өөрчлөгдсөн үеийн харагдац
        OutlinedButton(
          onPressed: () {},
          child: const Text(DemoStrings.customizedView),
          style: OutlinedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: const BorderSide(
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
