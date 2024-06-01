import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/my_colors.dart';
import '../../logic/home_controller.dart';

class HomeAppBar extends GetView<HomeController> {
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
            const SizedBox(),
            // Icon(Icons.menu, color: Colors.white),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          onChanged: (value) => _filterList(value),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: MyColors.grey500, size: 26),
            hintText: 'Хайх',
          ),
        ),
        const SizedBox(height: 24),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  void _filterList(String query) {
    List dummy = controller.state.homeData['docs'];
    if (query.isEmpty) {
      controller.state.filteredList.value = controller.state.homeData['docs'];
    } else {
      controller.state.filteredList.value = dummy.where((item) => item['name'].toLowerCase().contains(query.toLowerCase())).toList();
    }
  }
}
