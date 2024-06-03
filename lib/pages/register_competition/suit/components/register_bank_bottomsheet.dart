import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';
import 'bank_item.dart';

class RegisterBankBottomSheet extends StatelessWidget {
  const RegisterBankBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Text(
          'Төлбөрийн хэрэгсэл',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Divider(height: 1, thickness: 1, color: MyColors.grey200),
        const SizedBox(height: 12),
        BankItem(onTap: () {}, bankIcon: '', bankName: 'QPay'),
      ],
    );
  }
}
