import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Тэмцээн',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.menu, color: Colors.white),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: MyColors.grey500, size: 26),
            hintText: 'Хайх',
          ),
        ),
        const SizedBox(height: 24),
      ],
    ).paddingSymmetric(horizontal: 16);
  }
}
