import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';

class RegisterNextButton extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  final String buttonText;
  const RegisterNextButton({required this.onNext, required this.buttonText, required this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(width: 1, color: MyColors.grey300),
      ),
      child: Row(
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: onBack,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: MyColors.grey300),
                ),
                child: Icon(Icons.chevron_left, color: MyColors.grey500),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: onNext,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    FaIcon.iconChevronRight,
                    style: FaIcon.regular().copyWith(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
