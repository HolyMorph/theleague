import 'package:flutter/material.dart';

import '../style/my_colors.dart';

class CollectionTitle extends StatelessWidget {
  final String name;
  const CollectionTitle({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _line = _lineWidget();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _line,
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          _line,
        ],
      ),
    );
  }

  Widget _lineWidget() {
    return const Text(
      '------------------------------',
      style: TextStyle(color: MyColors.hintColor),
    );
  }
}
