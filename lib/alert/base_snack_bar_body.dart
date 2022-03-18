import 'package:flutter/material.dart';

class BaseSnackBarBody extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? icon;
  const BaseSnackBarBody({Key? key, this.title, this.message, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (icon != null) icon!,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) Text(title!),
                  if (title != null) const SizedBox(height: 4),
                  if (message != null) Text(message!),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
