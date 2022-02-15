import 'package:flutter/material.dart';

import '../style/my_colors.dart';

class CollectionTitle extends StatelessWidget {
  final String name;
  const CollectionTitle({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _lineWidget(),
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          _lineWidget(),
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
