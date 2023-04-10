import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../alert/alert_helper.dart';
import '../collection_divider.dart';
import '../collection_title.dart';
import 'demo_custom_alert_body.dart';

class MySnackBarCollection extends StatefulWidget {
  const MySnackBarCollection({Key? key}) : super(key: key);

  @override
  _MySnackBarCollectionState createState() => _MySnackBarCollectionState();
}

class _MySnackBarCollectionState extends State<MySnackBarCollection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'SnackBars'),

        /// Энгийн [SnackBar] харуулах.
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              type: AlertType.snackBar,
              title: 'Толгой хэсгийн мсж',
              message: 'Тайлбар хэсэг',
              image: Container(
                margin: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.image,
                  size: 24,
                  color: Get.theme.colorScheme.background,
                ),
              ),
              onPositiveClicked: () {
                AlertHelper.showAlert(
                  message: 'Хаах товчлуур дарагдлаа',
                  type: AlertType.snackBar,
                );
              },
            );
          },
          child: const Text('Энгийн snackBar харуулах'),
        ),
        const CollectionDivider(),

        /// Загвар өөрчилсөн [SnackBar] харуулах.
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              type: AlertType.snackBar,
              child: const DemoCustomAlertBody(),
            );
          },
          child: const Text('Custom snackbar'),
        ),
      ],
    );
  }
}
