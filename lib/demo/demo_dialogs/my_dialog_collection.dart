import 'package:flutter/material.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';

import '../collection_divider.dart';

class MyDialogCollection extends StatefulWidget {
  const MyDialogCollection({Key? key}) : super(key: key);

  @override
  _MyDialogCollectionState createState() => _MyDialogCollectionState();
}

class _MyDialogCollectionState extends State<MyDialogCollection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'Dialogs'),

        ///Энгийн dialog харуулах
        ElevatedButton(
          onPressed: () {},
          child: const Text('Энгийн dialog харуулах'),
        ),
        const CollectionDivider(),

        ///Энгийн dialog харуулах
        ElevatedButton(
          onPressed: () {},
          child: const Text('Товчлууртай dialog харуулах'),
        ),
      ],
    );
  }
}
