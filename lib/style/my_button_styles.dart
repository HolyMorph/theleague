import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_text_styles.dart';

class MyButtonStyles {
  static const double buttonHeight = 48;
  static const double buttonMinWidth = 88;
  static EdgeInsets buttonPadding = const EdgeInsets.symmetric(horizontal: 12);

  static OutlinedBorder? buttonShape;

  ///Товчлуурын үндсэн загвар
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

  ///Товчлуурын үндсэн загвар.
  ///
  ///Энэ загвар нь [ElevatedButton], [OutlinedButton], [TextButton]-д ашиглагдана
  static ButtonStyle buttonStyle = ButtonStyle(
    ///Товчлуурын өнгөний тохиргоо
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        ///Идэвхгүй үеийн өнгө
        if (states.contains(MaterialState.disabled)) return Get.theme.disabledColor;

        ///Бусад үеийн өнгө
        return Get.theme.primaryColor;
      },
    ),

    ///Товчлуур дотор зай авах хэмжээ
    padding: MaterialStateProperty.all(buttonPadding),

    ///Товчлуурын сүүдрийн өнгө
    shadowColor: MaterialStateProperty.all(Get.theme.shadowColor),

    ///Товчлуурын хэлбэр
    shape: MaterialStateProperty.all(
      buttonShape,
    ),

    ///Товчлуурын хэмжээ
    minimumSize: MaterialStateProperty.all(
      const Size.fromHeight(buttonHeight),
    ),

    visualDensity: VisualDensity.standard,

    ///Товчлуурын товгорын хэмжээ буюу арын дэвсгэрээс нааш авах зай
    elevation: MaterialStateProperty.all(0),

    ///Хэлбэр болон elevation өөрчлөгдөхөд хийгдэх animation-ны хугацаа
    animationDuration: null,

    ///Товчлуурын текстийн стайл
    textStyle: MaterialStateProperty.all<TextStyle>(MyTextStyles.button ?? const TextStyle()),
  );

  ///[TextButton] Товчлуурын үндсэн загвар.
  static ButtonStyle textButtonStyle = buttonStyle.copyWith(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    minimumSize: MaterialStateProperty.all(
      const Size(buttonMinWidth, buttonHeight),
    ),
  );

  ///[OutlinedButton] товчлуурын үндсэн загвар.
  static ButtonStyle outlinedButtonStyle = buttonStyle.copyWith(
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        ///Идэвхгүй үеийн хүрээний загвар
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            color: Get.theme.disabledColor,
            width: 1,
          );
        }

        ///Бусад үеийн хүрээний загвар
        return BorderSide(color: Get.theme.primaryColor, width: 1);
      },
    ),
    minimumSize: MaterialStateProperty.all(
      const Size(buttonMinWidth, buttonHeight),
    ),
  );
}
