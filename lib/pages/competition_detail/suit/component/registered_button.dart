import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class RegisteredButton extends StatelessWidget {
  const RegisteredButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(
              Icons.people,
              color: MyColors.primaryColor,
            ),
            const SizedBox(width: 8),
            Text(
              'Бүртгүүлсэн тамирчид',
              style: TextStyle(
                color: MyColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: Colors.black, size: 28),
          ],
        ),
      ),
    );
  }
}
