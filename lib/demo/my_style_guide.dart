import 'package:flutter/material.dart';
import 'package:mezorn_dummy/demo/demo_selectable_widgets/selectable_widget_collection.dart';
import 'package:mezorn_dummy/demo/demo_texts/text_collection.dart';

import 'demo_buttons/button_collection.dart';
import 'demo_textfield/textfields_collection.dart';

class MyStyleGuide extends StatefulWidget {
  const MyStyleGuide({Key? key}) : super(key: key);

  @override
  _MyStyleGuideState createState() => _MyStyleGuideState();
}

class _MyStyleGuideState extends State<MyStyleGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Guide'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Доорх виджетүүдийн энгийн хувилбарууд нь гаргасан дезайны загвартай таарч байх ёстой'),

                ///Товчлууруудын загвар
                ButtonCollection(),

                ///TextField-ийн загварууд
                TextFieldsCollection(),

                ///Текстүүдийн загвар
                TextCollection(),

                ///Сонгогдох боломжтой виджетүүдийн загвар
                SelectableWidgetCollection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
