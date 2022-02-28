import 'package:flutter/material.dart';
import 'package:mezorn_dummy/demo/collection_divider.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';

class MyIconCollection extends StatelessWidget {
  const MyIconCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'Icons'),
        Wrap(
          spacing: 12,
          children: const [
            Icon(Icons.star),
            Icon(Icons.map),
            Icon(Icons.cancel),
            Icon(Icons.edit),
            Icon(Icons.message),
          ],
        ),
        const CollectionDivider(),
      ],
    );
  }
}
