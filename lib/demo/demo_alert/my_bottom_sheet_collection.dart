import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/alert/alert_helper.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';

import '../collection_divider.dart';
import 'demo_custom_alert_body.dart';

class MyBottomSheetCollection extends StatefulWidget {
  const MyBottomSheetCollection({Key? key}) : super(key: key);

  @override
  _MyBottomSheetCollectionState createState() => _MyBottomSheetCollectionState();
}

class _MyBottomSheetCollectionState extends State<MyBottomSheetCollection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CollectionTitle(name: 'BottomSheets'),

        ///Энгийн [BottomSheet] харуулах
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
                type: AlertType.bottomSheet,
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
                    type: AlertType.bottomSheet,
                  );
                },
                onPositiveClicked: () {
                  AlertHelper.showAlert(
                    message: 'Хаах товчлуур дарагдлаа',
                    type: AlertType.bottomSheet,
                  );
                });
          },
          child: const Text('Энгийн dialog харуулах'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн [BottomSheet] харуулах
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              type: AlertType.bottomSheet,
              child: const DemoCustomAlertBody(),
            );
          },
          child: const Text('Custom dialog 1'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн [BottomSheet] харуулах
        ///
        /// Энэ тохиолдолд [BottomSheet]-ийг тэр чигт нь өөрчилж харуулж байгаа
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              type: AlertType.bottomSheet,
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
