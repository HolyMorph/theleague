import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';

class SettingsTextField extends StatelessWidget {
  final String title;
  final String initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final bool isActive;
  final VoidCallback? onTap;

  const SettingsTextField({
    required this.title,
    required this.initialValue,
    required this.isActive,
    this.onTap,
    this.prefix,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: MyColors.grey700,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            onTap: onTap,
            enabled: isActive,
            initialValue: initialValue,
            decoration: InputDecoration(
              prefix: prefix,
              suffix: suffix,
            ),
          ),
        ],
      ),
    );
  }
}
