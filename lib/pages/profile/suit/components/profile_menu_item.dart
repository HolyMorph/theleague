import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const ProfileMenuItem({required this.onTap, required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: MyColors.grey500.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  icon,
                  textAlign: TextAlign.center,
                  style: FaIcon.regular().copyWith(color: MyColors.greyBlue800, fontSize: 16),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: MyColors.greyBlue800,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.chevron_right,
                size: 30,
                color: MyColors.grey500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
