import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';

class RegisterTypeItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imagePath;
  final VoidCallback onTap;
  final Color buttonColor;

  const RegisterTypeItem({
    required this.title,
    required this.imagePath,
    required this.desc,
    required this.onTap,
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 8,
              color: MyColors.grey300,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              scale: 3,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: buttonColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    desc,
                    style: TextStyle(fontSize: 10, color: buttonColor),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: buttonColor,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
