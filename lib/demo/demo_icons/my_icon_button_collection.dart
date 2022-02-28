import 'package:flutter/material.dart';

import '../collection_divider.dart';
import '../collection_title.dart';

class MyIconButtonCollection extends StatelessWidget {
  const MyIconButtonCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'Icon buttons'),
        Wrap(
          spacing: 12,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.map),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const CollectionDivider(),
      ],
    );
  }
}
