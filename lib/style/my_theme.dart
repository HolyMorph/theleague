import 'package:flutter/material.dart';

import 'my_button_styles.dart';
import 'my_colors.dart';
import 'my_text_field_style.dart';
import 'style_export.dart';

class MyTheme {
  static final MyTheme _instance = MyTheme._internal();
  factory MyTheme() => _instance;

  MyTheme._internal();

  static String fontFamily = 'GIP';
  static MyTheme get instance => _instance;

  /// Апп-ын үндсэн загвар.
  ThemeData get themeData => ThemeData(
        /// Апп-ны хэмжээнд ашиглагдах үндсэн фонт. Custom фонт бол pubspec.yaml дотор зааж өгсөн байх шаардлагатай.
        fontFamily: fontFamily,
        primarySwatch: Colors.blue,
        dividerColor: MyColors.dividerColor,
        scaffoldBackgroundColor: Colors.white,
        hintColor: MyColors.hintColor,
        colorScheme: ColorScheme.light(
          primary: MyColors.primaryColor,
          secondary: MyColors.secondaryColor,
          background: MyColors.backgroundColor,
          error: MyColors.errorColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: MyButtonStyles.elevatedButtonStyle,
        ),
        textButtonTheme: TextButtonThemeData(
          style: MyButtonStyles.textButtonStyle,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 55,
          elevation: 0,
          centerTitle: true,
          foregroundColor: MyColors.backgroundColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'GIP',
          ),
          actionsIconTheme: IconThemeData(color: Colors.black),
          toolbarTextStyle: TextStyle(color: Colors.white, fontFamily: 'GIP'),
        ),
        inputDecorationTheme: MyTextFieldStyle.inputDecoration,
        splashFactory: InkRipple.splashFactory,
      );
}
