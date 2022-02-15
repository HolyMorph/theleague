import 'package:flutter/material.dart';
import 'package:mezorn_dummy/demo/collection_title.dart';

import 'checkboxes_widget.dart';
import 'radio_buttons_widget.dart';

class SelectableWidgetCollection extends StatefulWidget {
  const SelectableWidgetCollection({Key? key}) : super(key: key);

  @override
  _SelectableWidgetCollectionState createState() => _SelectableWidgetCollectionState();
}

class _SelectableWidgetCollectionState extends State<SelectableWidgetCollection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CollectionTitle(name: 'Checkboxes'),

        ///CheckBoxes
        CheckboxesWidget(),

        CollectionTitle(name: 'Radio buttons'),
        RadioButtonsWidget(),
      ],
    );
  }
}
