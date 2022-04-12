import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/style/my_button_styles.dart';
import 'package:mezorn_dummy/style/my_text_field_style_dark.dart';
import 'package:mezorn_dummy/style/my_text_styles.dart';
import 'package:mezorn_dummy/style/my_theme.dart';

import 'my_colors_dark.dart';

class MyThemeDark {
  ///Апп-ын бараан загвар
  static ThemeData darkTheme = ThemeData(
    ///Апп-д ашиглагдах нийт өнгөнүүд тохируулах

    primaryColor: MyColorsDark.primaryColor,
    primaryColorLight: MyColorsDark.primaryColorLight,
    primaryColorDark: MyColorsDark.primaryColorDark,
    scaffoldBackgroundColor: MyColorsDark.scaffoldBackgroundColor,
    unselectedWidgetColor: MyColorsDark.unselectedWidgetColor,
    disabledColor: MyColorsDark.disabledColor,
    hintColor: MyColorsDark.hintColor,
    errorColor: MyColorsDark.errorColor,
    backgroundColor: MyColorsDark.backgroundColor,
    dividerColor: MyColorsDark.dividerColor,
    splashColor: MyColorsDark.splashColor,
    bottomAppBarColor: MyColorsDark.bottomAppBarColor,
    cardColor: MyColorsDark.cardColor,
    focusColor: MyColorsDark.focusColor,
    hoverColor: MyColorsDark.hoverColor,
    highlightColor: MyColorsDark.highlightColor,
    selectedRowColor: MyColorsDark.selectedRowColor,
    canvasColor: MyColorsDark.canvasColor,

    ///Үндсэн icon-ын загвар
    primaryIconTheme: const IconThemeData(
      color: MyColorsDark.darkAccentColor,
    ),

    ///Апп-ын нийт сүүдэрний өнгө
    shadowColor: MyColorsDark.shadowColor,

    ///Dialog-ийн арын дэвсгэр өнгө
    dialogBackgroundColor: MyColorsDark.dialogBackgroundColor,

    ///CheckBox, Radio гэх мэт тийм үгүй гэсэн сонголттой виджетүүдийн идэвхтэй үеийн өнгө
    toggleableActiveColor: MyColorsDark.darkAccentColor,

    ///
    visualDensity: VisualDensity.adaptivePlatformDensity,

    ///Апп-ны хэмжээнд ашиглагдах үндсэн фонт. Custom фонт бол pubspec.yaml дотор зааж өгсөн байх шаардлагатай
    fontFamily: MyTextStyles.baseFont,

    ///BottomNavigation-ны загвар
    bottomNavigationBarTheme: MyTheme.bottomNavigationBarTheme.copyWith(
      selectedItemColor: MyColorsDark.darkAccentColor,
      unselectedItemColor: MyColorsDark.darkAccentColor.withOpacity(0.4),
      backgroundColor: MyColorsDark.primaryColorDark.withOpacity(0.4),
      selectedIconTheme: const IconThemeData(color: MyColorsDark.darkAccentColor),
      unselectedIconTheme: IconThemeData(color: MyColorsDark.darkAccentColor.withOpacity(0.4)),
    ),

    ///[TextFormField] болон [SelectableText]-ийн select хийх загвар
    ///
    ///Select хийх cursor-ийн өнгө, чирэх бөөрөнхийн өнгө гэх мэт
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MyColorsDark.darkAccentColor,
      selectionColor: MyColorsDark.darkAccentColor,
      selectionHandleColor: MyColorsDark.darkAccentColor,
    ),

    ///[DiaLog]-ийн загвар
    dialogTheme: MyTheme.dialogTheme.copyWith(
      backgroundColor: MyColorsDark.backgroundColor,
    ),

    ///Доороос гарч ирдэг bottomSheet-ийн загвар
    bottomSheetTheme: MyTheme.bottomSheetThemeData.copyWith(
      backgroundColor: MyColorsDark.backgroundColor,
    ),

    ///Доор харагддаг AppBar-ийн загвар
    bottomAppBarTheme: null,

    ///ТabBar-ийн загвар
    tabBarTheme: MyTheme.tabBarTheme,

    ///Хуудас шилжилтийн загвар
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    ///[AppBar]-ийн загвар
    appBarTheme: MyTheme.appBarTheme.copyWith(
      color: Colors.black12,
    ),

    ///ToggleButton загвар
    toggleButtonsTheme: null,

    ///Товчлуурын үндсэн загвар
    buttonTheme: MyButtonStyles.buttonThemeData,

    ///[Scaffold] дээр харагдах [FAB] буюу бөөрөнхий товчлуурын загвар
    floatingActionButtonTheme: null,

    ///Card виджетийн загвар
    cardTheme: null,

    ///Slider буюу 2 тийш чирж утга өөрчилөх виджетийн загвар
    sliderTheme: null,

    ///Switch товчлуурын загвар
    switchTheme: null,

    ///RadioButton-ны загвар
    radioTheme: null,

    ///CheckBox-ийн загвар
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          ///Идэвхгүй үеийн өнгө
          if (states.contains(MaterialState.disabled)) return MyColorsDark.darkAccentColor.withOpacity(0.2);

          ///Бусад үеийн өнгө
          return MyColorsDark.primaryColorDark;
        },
      ),
    ),

    ///SnackBar-ийн загвар
    snackBarTheme: MyTheme.snackBarTheme.copyWith(
      backgroundColor: MyColorsDark.darkAccentColor,
      behavior: SnackBarBehavior.fixed,
      actionTextColor: Colors.black,
    ),

    ///Divider виджетийн загвар
    dividerTheme: null,

    ///Progress-уудын загвар.
    ///Linear, Circular болон Refresh-ийн загварууд энд сольж өгнө
    progressIndicatorTheme: MyTheme.progressIndicatorTheme.copyWith(
      color: MyColorsDark.darkAccentColor,
    ),

    ///ListTile-ийн загвар
    listTileTheme: null,

    ///Chip виджетийн загвар
    chipTheme: null,

    ///Гадуураа хүрээтэй товчлуурын загвар
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: MyButtonStyles.outlinedButtonStyle.copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            ///Идэвхгүй үеийн хүрээ
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: Get.theme.disabledColor,
              );
            }

            ///Бусад үеийн хүрээ
            return const BorderSide(
              color: MyColorsDark.darkAccentColor,
            );
          },
        ),
        overlayColor: MaterialStateProperty.all(
          MyColorsDark.darkAccentColor.withOpacity(0.4),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            ///Идэвхгүй үеийн өнгө
            if (states.contains(MaterialState.disabled)) return Get.theme.disabledColor;

            ///Бусад үеийн өнгө
            return MyColorsDark.darkAccentColor;
          },
        ),
      ),
    ),

    ///Текстэн товчлуурын загвар
    textButtonTheme: TextButtonThemeData(
      style: MyButtonStyles.textButtonStyle.copyWith(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            ///Идэвхгүй үеийн өнгө
            if (states.contains(MaterialState.disabled)) return Get.theme.disabledColor;

            ///Бусад үеийн өнгө
            return MyColorsDark.darkAccentColor;
          },
        ),
        overlayColor: MaterialStateProperty.all(
          MyColorsDark.darkAccentColor.withOpacity(0.4),
        ),
      ),
    ),

    ///ElevatedButton-ны загвар
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: MyButtonStyles.buttonStyle,
    ),

    ///TextForm үндсэн стайл
    inputDecorationTheme: MyTextFieldStyleDark.inputTheme.copyWith(),

    ///Апп-д ашиглах текстүүдийн стайл
    textTheme: MyTheme.textTheme,

    brightness: Brightness.dark,
  );
}
