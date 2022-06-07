import 'package:flutter/material.dart';

import '../collection_divider.dart';
import '../demo_buttons/elevated_buttons_widget.dart';
import 'outlined_buttons_widget.dart';
import 'text_buttons_widget.dart';

class ButtonCollection extends StatelessWidget {
  const ButtonCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        /// [ElevatedButton] загварууд.
        ElevatedButtonsWidget(),

        CollectionDivider(),

        /// [TextButton] загварууд.
        TextButtonsWidget(),

        /// [TextButton] загварууд.
        OutlinedButtonsWidget(),
      ],
    );
  }
}
