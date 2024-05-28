import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../style/my_colors.dart';
import '../style/style_export.dart';

class PinInput extends StatelessWidget {
  final int length;
  final void Function(String)? onCompleted;
  final void Function(String) onChanged;
  PinInput({required this.onCompleted, required this.onChanged, Key? key, this.length = 6}) : super(key: key);

  ///It is used in 2 different places at the same time.
  final defaultPinTheme = PinTheme(
    width: (MediaQuery.of(Get.context!).size.width / 6) - 8,
    height: (MediaQuery.of(Get.context!).size.width / 6),
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: MyColors.primaryColor,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1, color: MyColors.grey300),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length,
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      onCompleted: onCompleted,
      onChanged: onChanged,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      preFilledWidget: const Text(
        '0',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 42,
          color: MyColors.grey100,
          fontWeight: FontWeight.w500,
        ),
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.2),
            ),
          ],
        ),
      ),
    );
  }
}
