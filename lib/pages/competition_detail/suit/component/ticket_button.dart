import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';

class TicketButton extends StatelessWidget {
  final String faIcon;
  final String btnText;
  final VoidCallback onTap;

  const TicketButton({required this.onTap, required this.btnText, required this.faIcon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(
          top: BorderSide(width: 1, color: MyColors.grey300),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  faIcon,
                  style: FaIcon.regular().copyWith(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  btnText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
        ],
      ),
    );
  }
}
