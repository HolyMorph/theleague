import 'package:flutter/material.dart';

import 'my_colors.dart';
import 'my_textfield_border.dart';

class MyTextFieldStyle {
  static InputDecorationTheme inputDecoration = const InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    labelStyle: TextStyle(fontSize: 16, color: MyColors.permissionGreyColor),
    hintStyle: TextStyle(color: MyColors.grey400, fontSize: 14, fontWeight: FontWeight.w600),
    errorStyle: TextStyle(fontSize: 12, color: MyColors.errorColor),
    counterStyle: TextStyle(fontSize: 0),
    errorBorder: MyTextFieldBorder(),
    border: MyTextFieldBorder(),
    enabledBorder: MyTextFieldBorder(),
    focusedBorder: MyTextFieldBorder(),
    disabledBorder: MyTextFieldBorder(),
  );
}
