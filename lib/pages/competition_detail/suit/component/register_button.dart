import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onTap;
  const RegisterButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border.all(width: 1, color: MyColors.grey400),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    '40,000',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: MyColors.primaryColor,
                    ),
                  ),
                  Text(
                    '₮',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Arial',
                      color: MyColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                'Багийн хураамж',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: MyColors.grey500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: ElevatedButton(
              onPressed: () => onTap(),
              child: Text('Бүртгүүлэх'),
            ),
          ),
        ],
      ),
    );
  }
}
