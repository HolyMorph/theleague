import 'package:flutter/material.dart';

class MyLoadingDialogBody extends StatelessWidget {
  final String? message;
  const MyLoadingDialogBody({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(width: 12),
        Expanded(
          child: Text(message ?? 'Уншиж байна'),
        ),
      ],
    );
  }
}
