import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_colors.dart';
import 'my_text_styles.dart';

class MyButtonStyles {
  static const double buttonHeight = 48;
  static const double buttonMinWidth = 88;
  static EdgeInsets buttonPadding = const EdgeInsets.symmetric(horizontal: 12);

  static OutlinedBorder? buttonShape;

  ///Товчлуурын үндсэн загвар.
  ///
  ///Энэ загвар нь [ElevatedButton], [OutlinedButton], [TextButton]-д ашиглагдана
  static ButtonStyle buttonStyle = ButtonStyle(
    /// Товчлуурын өнгөний тохиргоо.
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        /// Идэвхгүй үеийн өнгө.
        if (states.contains(MaterialState.disabled)) return Get.theme.disabledColor;

        /// Бусад үеийн өнгө.
        return Get.theme.primaryColor;
      },
    ),

    /// Товчлуур дотор зай авах хэмжээ.
    padding: MaterialStateProperty.all(buttonPadding),

    /// Товчлуурын сүүдрийн өнгө.
    shadowColor: MaterialStateProperty.all(Get.theme.shadowColor),

    /// Товчлуурын хэлбэр.
    shape: MaterialStateProperty.all(
      buttonShape,
    ),

    /// Товчлуурын хэмжээ.
    minimumSize: MaterialStateProperty.all(
      const Size.fromHeight(buttonHeight),
    ),

    visualDensity: VisualDensity.standard,

    /// Товчлуурын товгорын хэмжээ буюу арын дэвсгэрээс нааш авах зай.
    elevation: MaterialStateProperty.all(0),

    /// Хэлбэр болон elevation өөрчлөгдөхөд хийгдэх animation-ны хугацаа.
    animationDuration: null,

    /// Товчлуурын текстийн стайл.
    textStyle: MaterialStateProperty.all<TextStyle>(
      MyTextStyles.button ?? const TextStyle(color: MyColors.primaryColor),
    ),

    /// Splash буюу дарахад үүсэх цацрагын өнгө.
    overlayColor: MaterialStateProperty.all(
      MyColors.primaryColor.withOpacity(0.2),
    ),
  );

  /// Товчлуурын үндсэн загвар.
  static ButtonThemeData buttonThemeData = ButtonThemeData(
    height: buttonHeight,
    shape: buttonShape,
    padding: buttonPadding,
    buttonColor: Get.theme.primaryColor,
    disabledColor: Get.theme.disabledColor,
    minWidth: double.infinity,
    splashColor: Get.theme.splashColor,
    focusColor: Get.theme.focusColor,
    hoverColor: Get.theme.hoverColor,
    highlightColor: Get.theme.highlightColor,
  );

  /// [OutlinedButton] товчлуурын үндсэн загвар.
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: MyColors.primaryColor,
    minimumSize: const Size(buttonMinWidth, buttonHeight),
  );

  /// [TextButton] Товчлуурын үндсэн загвар.
  static ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: MyColors.primaryColor,
    backgroundColor: Colors.transparent,
    minimumSize: const Size(
      buttonMinWidth,
      buttonHeight,
    ),
  );
}
