import 'package:flutter/material.dart';

import '../../../style/my_colors.dart';
import '../../settings/suit/components/settings_textfield.dart';

class RegisterPagePersonal extends StatelessWidget {
  const RegisterPagePersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsTextField(
          title: 'Овог',
          initialValue: '',
          isActive: true,
        ),
        const SizedBox(height: 16),
        SettingsTextField(
          title: 'Нэр',
          initialValue: '',
          isActive: true,
        ),
        const SizedBox(height: 16),
        SettingsTextField(
          title: 'Регистрийн дугаар',
          initialValue: '',
          isActive: true,
        ),
        const SizedBox(height: 8),
        Text(
          'Pегистрийн дугаарыг дараа нь засах боломжгүй тул үнэн зөвөөр бөглгөнө үү.',
          style: TextStyle(
            fontSize: 14,
            color: MyColors.grey600,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          child: Text('Үргэлжлүүлэх'),
        ),
      ],
    );
  }
}
