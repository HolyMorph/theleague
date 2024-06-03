import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';

class ParentPollItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ParentPollItem({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.primaryColor,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: MyColors.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
