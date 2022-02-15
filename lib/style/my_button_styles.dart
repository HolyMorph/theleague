import 'package:flutter/material.dart';
import 'package:mezorn_dummy/style/my_colors.dart';
import 'package:mezorn_dummy/style/my_text_styles.dart';

class MyButtonStyles {
  static const double buttonHeight = 48;
  static const double buttonMinWidth = 88;
  static const Color buttonColor = MyColors.primaryColor;
  static const Color disabledColor = MyColors.disabledColor;
  static EdgeInsets buttonPadding = const EdgeInsets.symmetric(horizontal: 12);

  static OutlinedBorder? buttonShape;

  ///Товчлуурын үндсэн загвар
  static ButtonThemeData buttonThemeData = ButtonThemeData(
    height: buttonHeight,
    shape: buttonShape,
    padding: buttonPadding,
    buttonColor: buttonColor,
    disabledColor: disabledColor,
    minWidth: double.infinity,
    splashColor: MyColors.splashColor,
    focusColor: MyColors.focusColor,
    hoverColor: MyColors.hoverColor,
    highlightColor: MyColors.highlightColor,
  );

  ///Товчлуурын үндсэн загвар.
  ///
  ///Энэ загвар нь [ElevatedButton], [OutlinedButton], [TextButton]-д ашиглагдана
  static ButtonStyle buttonStyle = ButtonStyle(
    ///Товчлуурын өнгөний тохиргоо
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        ///Идэвхгүй үеийн өнгө
        if (states.contains(MaterialState.disabled)) return disabledColor;

        ///Бусад үеийн өнгө
        return buttonColor;
      },
    ),

    ///Товчлуур дотор зай авах хэмжээ
    padding: MaterialStateProperty.all(buttonPadding),

    ///Товчлуурын сүүдрийн өнгө
    shadowColor: MaterialStateProperty.all(MyColors.shadowColor),

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
          return const BorderSide(
            color: MyColors.disabledColor,
            width: 1,
          );
        }

        ///Бусад үеийн хүрээний загвар
        return const BorderSide(color: MyColors.primaryColor, width: 1);
      },
    ),
    minimumSize: MaterialStateProperty.all(
      const Size(buttonMinWidth, buttonHeight),
    ),
  );
}
