import 'package:flutter/material.dart';

import '../collection_divider.dart';
import '../collection_title.dart';
import '../demo_strings.dart';

class ElevatedButtonsWidget extends StatelessWidget {
  const ElevatedButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: '[ElevatedButton] загварууд'),

        /// Энгийн үеийн харагдац.
        ElevatedButton(
          onPressed: () {},
          child: const Text(DemoStrings.normalView),
        ),
        const CollectionDivider(),

        /// Идэвхгүй үеийн харагдац.
        const ElevatedButton(
          onPressed: null,
          child: Text(DemoStrings.disableView),
        ),
        const CollectionDivider(),

        /// Загвар өөрчлөгдсөн үеийн харагдац.
        ElevatedButton(
          onPressed: () {},
          child: const Text(DemoStrings.customizedView),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 7,
          ),
        ),
      ],
    );
  }
}
