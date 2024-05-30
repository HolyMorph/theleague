import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';

class SettingsTextField extends StatelessWidget {
  final String title;
  final String? initialValue;
  final String hintText;
  final TextEditingController? textEditingController;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? inputType;
  final bool isActive;
  final bool? isRequired;
  final VoidCallback? onTap;

  const SettingsTextField({
    required this.title,
    required this.isActive,
    required this.hintText,
    this.initialValue,
    this.onTap,
    this.inputType,
    this.textEditingController,
    this.errorText,
    this.isRequired,
    this.prefix,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: MyColors.grey700,
              ),
            ),
            if (isRequired ?? false)
              Text(
                '*',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: MyColors.errorColor,
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: textEditingController,
          onTap: onTap,
          enabled: isActive,
          keyboardType: inputType,
          initialValue: initialValue,
          decoration: InputDecoration(
            prefixIcon: prefix,
            hintText: hintText,
            suffix: suffix,
          ),
          validator: (value) => ((value ?? '').isEmpty && (isRequired ?? false)) ? errorText : null,
        ),
      ],
    );
  }
}
