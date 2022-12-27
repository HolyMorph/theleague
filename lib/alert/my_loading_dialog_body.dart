// ignore_for_file: unused-code
// ignore_for_file: unused-files
import 'package:flutter/material.dart';

import '../components/my_loading_widget.dart';

class MyLoadingDialogBody extends StatelessWidget {
  final String? message;
  const MyLoadingDialogBody({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MyLoadingWidget(),
        const SizedBox(width: 12),
        Expanded(
          child: Text(message ?? 'Уншиж байна'),
        ),
      ],
    );
  }
}
