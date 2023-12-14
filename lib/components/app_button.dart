import 'package:flutter/material.dart';

import '../style/my_colors.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const AppButton({required this.child, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyColors.buttonBackColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
