import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../alert/alert_helper.dart';
import '../collection_divider.dart';
import '../collection_title.dart';
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
              onNegativeClicked: () {},
              onPositiveClicked: () {},
            );
          },
          child: const Text('Энгийн bottom sheet харуулах'),
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
          child: const Text('Custom bottom sheet 1'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн том контенттой [BottomSheet]
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              type: AlertType.bottomSheet,
              child: const DemoCustomAlertBody(
                isScrollable: true,
              ),
              isScrollable: true,
            );
          },
          child: const Text('Big content'),
        ),
        const CollectionDivider(),

        ///Загвар өөрчилсөн [BottomSheet] харуулах
        ///
        /// Энэ тохиолдолд [BottomSheet]-ийг тэр чигт нь өөрчилж харуулж байгаа
        ElevatedButton(
          onPressed: () {
            AlertHelper.showAlert(
              type: AlertType.bottomSheet,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: const DemoCustomAlertBody(),
              ),
              replaceWholeWidget: true,
            );
          },
          child: const Text('Custom bottom sheet 2'),
        ),
      ],
    );
  }
}
