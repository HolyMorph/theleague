import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';

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
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            border: Border.all(width: 2, color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: Get.size.width * 0.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'GIP',
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
