import 'package:flutter/material.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).viewPadding.top + 24,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Text(
            'Сонгосон тоглогчид',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(color: Colors.white, thickness: 1, height: 1),
        ],
      ),
    );
  }
}
