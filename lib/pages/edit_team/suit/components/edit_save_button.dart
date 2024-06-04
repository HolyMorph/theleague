import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class EditSaveButton extends StatelessWidget {
  const EditSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(width: 1, color: MyColors.grey300),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Хадгалах'),
      ),
    );
  }
}
