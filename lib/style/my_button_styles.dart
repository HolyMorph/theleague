import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_colors.dart';
import 'my_text_styles.dart';

class MyButtonStyles {
  static const double buttonHeight = 50;
  static const double buttonMinWidth = 88;
  static EdgeInsets buttonPadding = const EdgeInsets.symmetric(horizontal: 12);

  static OutlinedBorder? buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  );

  ///Base button style
  ///
  ///Энэ загвар нь [ElevatedButton], [OutlinedButton], [TextButton]-д ашиглагдана
  static ButtonStyle buttonStyle = ButtonStyle(
    /// Товчлуурын өнгөний тохиргоо.
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        /// Идэвхгүй үеийн өнгө.
        if (states.contains(MaterialState.disabled)) return MyColors.buttonDisabledColor;

        /// Бусад үеийн өнгө.
        return MyColors.buttonColor;
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
    // textStyle: MaterialStateProperty.all<TextStyle>(
    //   MyTextStyles.labelLarge ?? const TextStyle(),
    // ),

    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) return MyTextStyles.disabledStyle;

        return MyTextStyles.labelLarge ?? const TextStyle();
      },
    ),

    foregroundColor: MaterialStateProperty.all(Colors.white),

    /// Splash буюу дарахад үүсэх цацрагын өнгө.
    overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
  );

  /// Товчлуурын үндсэн загвар.
  static ButtonThemeData buttonThemeData = ButtonThemeData(
    height: buttonHeight,
    shape: buttonShape,
    padding: buttonPadding,
    buttonColor: MyColors.buttonColor,
    disabledColor: Get.theme.disabledColor,
    minWidth: double.infinity,
    splashColor: Get.theme.splashColor,
    focusColor: Get.theme.focusColor,
    hoverColor: Get.theme.hoverColor,
    highlightColor: Get.theme.highlightColor,
  );

  /// Elevated button style
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: MyColors.primaryColor,
    foregroundColor: Colors.white,
    disabledBackgroundColor: MyColors.buttonDisabledColor,
    disabledForegroundColor: Colors.white,
    elevation: 1,
    shadowColor: const Color(0x1EFF9900),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    minimumSize: const Size(double.infinity, 44),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );

  /// [OutlinedButton] товчлуурын үндсэн загвар.
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    backgroundColor: MyColors.buttonColor,
    foregroundColor: MyColors.primaryColor,
    minimumSize: const Size(buttonMinWidth, buttonHeight),
  );

  /// [TextButton] Товчлуурын үндсэн загвар.
  static ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: MyColors.primaryColor,
    backgroundColor: MyColors.buttonColor,
    minimumSize: const Size(
      buttonMinWidth,
      buttonHeight,
    ),
  );
}
