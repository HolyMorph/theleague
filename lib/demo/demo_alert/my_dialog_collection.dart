import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/alert/alert_helper.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';

import '../collection_divider.dart';
import 'demo_custom_alert_body.dart';

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
          onPressed: () {
            AlertHelper.showAlert(
                title: 'Толгой хэсгийн мсж',
                message: 'Тайлбар хэсэг',
                image: Icon(
                  Icons.image,
                  size: 78,
                  color: Get.theme.disabledColor,
                ),
                negativeText: 'Цуцлах\n',
                onNegativeClicked: () {
                  AlertHelper.showAlert(
                    message: 'Цуцлах товчлуур дарагдлаа',
                    type: AlertType.snackBar,
                  );
                },
                onPositiveClicked: () {
                  AlertHelper.showAlert(
                    message: 'Хаах товчлуур дарагдлаа',
                    type: AlertType.snackBar,
                  );
                });
          },
          child: const Text('Энгийн dialog харуулах'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн dialog харуулах
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              child: const DemoCustomAlertBody(),
            );
          },
          child: const Text('Custom dialog 1'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн том контенттой dialog харуулах
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              child: const DemoCustomAlertBody(
                isScrollable: true,
              ),
              isScrollable: true,
            );
          },
          child: const Text('Big content'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн dialog харуулах
        ///
        /// Энэ тохиолдолд dialog-ийг тэр чигт өөрчилж харуулж байгаа
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              child: Container(
                decoration: const BoxDecoration(color: Colors.red),
                child: const DemoCustomAlertBody(),
              ),
              replaceWholeWidget: true,
            );
          },
          child: const Text('Custom dialog 2'),
        ),
      ],
    );
  }
}
