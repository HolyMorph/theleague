import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/alert/alert_helper.dart';

import '../collection_divider.dart';
import '../collection_title.dart';

class MyProgressCollection extends StatelessWidget {
  const MyProgressCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'Progresses'),
        const CircularProgressIndicator(),
        const CollectionDivider(),
        const LinearProgressIndicator(),
        const CollectionDivider(),
        ElevatedButton(
          onPressed: () {
            AlertHelper.showLoadingAlert();
          },
          child: const Text('Show loading dialog'),
        ),
      ],
    );
  }
}
