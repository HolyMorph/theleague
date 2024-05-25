import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class SettingsSaveButton extends StatelessWidget {
  const SettingsSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(width: 1, color: MyColors.grey200),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: MyColors.grey200,
            blurRadius: 8,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Text('Хадгалах'),
      ),
    );
  }
}
