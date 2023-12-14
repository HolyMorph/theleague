import 'package:flutter/material.dart';

import '../../style/my_colors.dart';

class SelectLeagueItem extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final String text;
  const SelectLeagueItem({required this.text, required this.imagePath, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              Image.asset(imagePath),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
