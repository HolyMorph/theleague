import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_button_styles.dart';
import 'my_colors.dart';
import 'my_text_field_style.dart';
import 'my_text_styles.dart';

class MyTheme {
  /// Апп-ын [AppBar]-ийн загвар.
  static AppBarTheme appBarTheme = AppBarTheme(
    /// Дэвсгэр өнгө.
    backgroundColor: MyColors.primaryColor,

    /// Товгорын хэмжээ 0-с их тохиолдолд ард нь тусах сүүдрийн өнгө.
    shadowColor: Get.theme.shadowColor,

    /// Өндрийн хэмжээ.
    toolbarHeight: 55,

    /// Actions буюу меню байгаа бол тухайн менюны загвар.
    actionsIconTheme: null,

    /// AppBar-ийн гарчиг төвдөө харагдах эсэх.
    centerTitle: true,

    /// [AppBar]-ийн буцах болон burger цэсний загвар.
    iconTheme: null,

    /// AppBar-ийн хэлбэр. Дугуй хүрээтэй байх эсэх нтр гээд.
    shape: null,

    /// AppBar-ийн гарчигны загвар.
    titleTextStyle: MyTextStyles.appBarTitleStyle,

    /// AppBar-ийн товгорын хэмжээ.
    elevation: 0,
  );

  /// [BottomNavigationBar]-ны загвар.
  static BottomNavigationBarThemeData bottomNavigationBarTheme = BottomNavigationBarThemeData(
    /// Арын дэвсгэр өнгө.
    backgroundColor: Colors.white,

    /// Товгорын хэмжээ.
    elevation: 0,

    /// Сонгогдсон гарчигийг харуулах эсэх.
    showSelectedLabels: true,

    /// Сонгогдоогүй гарчигийг харуулах эсэх.
    showUnselectedLabels: true,

    /// Төрөл. Бүгд тэнцүү зайгаа хувааж авах эсвэл сонгогдсон нь арай илүү зай эзлэх гэх мэт.
    type: BottomNavigationBarType.fixed,

    /// Сонгогдсон Tab-ийн Icon болон текстийн өнгө.
    selectedItemColor: Get.theme.primaryColor,

    /// Сонгогдоогүй Tab-ийн Icon болон текстийн өнгө.
    unselectedItemColor: Get.theme.unselectedWidgetColor,

    /// Сонгогдсон Tab-ийн Icon-ны загвар.
    selectedIconTheme: IconThemeData(color: Get.theme.primaryColor),

    /// Сонгогдоогүй Tab-ийн Icon-ны загвар.
    unselectedIconTheme: IconThemeData(color: Get.theme.unselectedWidgetColor),

    /// Сонгогдсон Tab-ийн гарчигны загвар.
    selectedLabelStyle: MyTextStyles.selectedLabelStyle,

    /// Сонгогдоогүй Tab-ийн гарчигны загвар.
    unselectedLabelStyle: MyTextStyles.unselectedLabelStyle,
  );

  /// [BottomSheet]-ийн загвар.
  static BottomSheetThemeData bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: MyColors.dialogBackgroundColor,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  /// [Dialog]-ийн загвар.
  static DialogTheme dialogTheme = DialogTheme(
    backgroundColor: MyColors.dialogBackgroundColor,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  /// Апп-ын үндсэн загвар.
  static ThemeData mainTheme = ThemeData(
    /// Апп-д ашиглагдах нийт өнгөнүүд тохируулах.

    primaryColorDark: MyColors.primaryColorDark,
    scaffoldBackgroundColor: MyColors.primaryColor,
    unselectedWidgetColor: MyColors.unselectedWidgetColor,
    disabledColor: MyColors.disabledColor,
    hintColor: MyColors.hintColor,
    dividerColor: MyColors.dividerColor,
    splashColor: MyColors.splashColor,
    cardColor: MyColors.cardColor,
    focusColor: MyColors.focusColor,
    hoverColor: MyColors.hoverColor,
    highlightColor: MyColors.highlightColor,
    canvasColor: MyColors.canvasColor,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: MyColors.primaryColor,
      onPrimary: MyColors.primaryColorLight,
      secondary: MyColors.secondaryColor,
      onSecondary: MyColors.secondaryColor,
      error: MyColors.errorColor,
      onError: MyColors.errorColor,
      background: MyColors.backgroundColor,
      onBackground: MyColors.backgroundColor,
      surface: MyColors.backgroundColor,
      onSurface: MyColors.backgroundColor,
    ),

    /// Апп-ын нийт сүүдэрний өнгө.
    shadowColor: MyColors.shadowColor,

    /// [Dialog]-ийн арын дэвсгэр өнгө.
    dialogBackgroundColor: MyColors.dialogBackgroundColor,

    ///
    visualDensity: VisualDensity.adaptivePlatformDensity,

    /// Апп-ны хэмжээнд ашиглагдах үндсэн фонт. Custom фонт бол pubspec.yaml дотор зааж өгсөн байх шаардлагатай.
    fontFamily: MyTextStyles.baseFont,

    /// BottomNavigation-ны загвар.
    bottomNavigationBarTheme: bottomNavigationBarTheme,

    ///[TextFormField] болон [SelectableText]-ийн select хийх загвар
    ///
    ///Select хийх cursor-ийн өнгө, чирэх бондгорын өнгө гэх мэт
    textSelectionTheme: null,

    /// [DiaLog]-ийн загвар.
    dialogTheme: dialogTheme,

    /// Доороос гарч ирдэг bottomSheet-ийн загвар.
    bottomSheetTheme: bottomSheetThemeData,

    /// Доор харагддаг AppBar-ийн загвар.
    bottomAppBarTheme: null,

    /// ТabBar-ийн загвар.
    tabBarTheme: tabBarTheme,

    /// Хуудас шилжилтийн загвар.
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    /// [AppBar]-ийн загвар.
    appBarTheme: appBarTheme,

    /// ToggleButton загвар.
    toggleButtonsTheme: null,

    /// Товчлуурын үндсэн загвар.
    buttonTheme: MyButtonStyles.buttonThemeData,

    /// [Scaffold] дээр харагдах [FAB] буюу бөөрөнхий товчлуурын загвар.
    floatingActionButtonTheme: null,

    /// Card виджетийн загвар.
    cardTheme: null,

    /// Slider буюу 2 тийш чирж утга өөрчилөх виджетийн загвар.
    sliderTheme: null,

    /// Switch товчлуурын загвар.
    switchTheme: null,

    /// RadioButton-ны загвар.
    radioTheme: null,

    /// CheckBox-ийн загвар.
    checkboxTheme: null,

    /// SnackBar-ийн загвар.
    snackBarTheme: snackBarTheme,

    /// Divider виджетийн загвар.
    dividerTheme: null,

    ///Progress-уудын загвар.
    ///Linear, Circular болон Refresh-ийн загварууд энд сольж өгнө
    progressIndicatorTheme: progressIndicatorTheme,

    /// ListTile-ийн загвар.
    listTileTheme: null,

    /// Chip виджетийн загвар.
    chipTheme: null,

    /// Гадуураа хүрээтэй товчлуурын загвар.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: MyButtonStyles.outlinedButtonStyle,
    ),

    /// Текстэн товчлуурын загвар.
    textButtonTheme: TextButtonThemeData(
      style: MyButtonStyles.textButtonStyle,
    ),

    /// ElevatedButton-ны загвар.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: MyButtonStyles.buttonStyle,
    ),

    /// TextForm үндсэн стайл.
    inputDecorationTheme: MyTextFieldStyle.inputTheme,

    /// Апп-д ашиглах текстүүдийн стайл.
    textTheme: textTheme,
  );

  /// [ProgressIndicator]-ийн загвар.
  static ProgressIndicatorThemeData progressIndicatorTheme = const ProgressIndicatorThemeData(
    color: MyColors.primaryColor,
  );

  /// [SnackBar]-ийн загвар.
  static SnackBarThemeData snackBarTheme = const SnackBarThemeData(
    backgroundColor: Colors.black,
    elevation: 2,
    actionTextColor: Colors.white,
  );

  /// [TabBar]-ийн загвар.
  static TabBarTheme tabBarTheme = TabBarTheme(
    /// Tab-ын сонгогдсон гарчигны өнгө.
    labelColor: Get.theme.primaryColor,

    /// Tab-ын сонгогдсон гарчигны загвар.
    labelStyle: MyTextStyles.selectedTabLabelStyle,

    /// Tab-ын сонгогдоогүй гарчигны өнгө.
    unselectedLabelColor: Get.theme.unselectedWidgetColor,

    /// Tab-ын сонгогдоогүй гарчигны загвар.
    unselectedLabelStyle: MyTextStyles.unselectedTabLabelStyle,

    /// Indicator буюу TabBar-ийн доогуур гүйх зураасны загвар.
    indicator: null,

    /// Indicator буюу TabBar-ийн доогуур гүйх зураасны хэмжээ.
    indicatorSize: null,

    /// Гарчигны зай авах хэмжээ.
    labelPadding: null,
  );

  // ///[Dialog]-ийн загвар
  // static DialogTheme dialogTheme = DialogTheme(
  //   backgroundColor: Colors.red,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  // );

  /// Апп-д ашиглах текстүүдийн стайл.
  static TextTheme textTheme = TextTheme(
    /// Үлэмж том текст.
    displayLarge: MyTextStyles.displayLarge,

    /// Аварга том текст.
    displayMedium: MyTextStyles.displayMedium,

    /// Дунд зэрэг том текст.
    displaySmall: MyTextStyles.displaySmall,

    /// Жоохон том текст.
    headlineMedium: MyTextStyles.headlineMedium,

    /// Том текст.
    headlineSmall: MyTextStyles.headlineSmall,

    /// [AppBar] болон [Dialog]-ийн гарчигны стайл.
    titleLarge: MyTextStyles.titleLarge,

    /// Үндсэн текстийн стайл. [TextForm]-ийн бичсэн текст, [ListTile]-ийн гарчиг гэх мэтэд ашиглагдана.
    titleMedium: MyTextStyles.titleMedium,

    /// Дунд зэргийн хэмжээтэй текст
    titleSmall: MyTextStyles.titleSmall,

    /// [bodyText2]-с арай том текстүүдэд ашиглах стайл.
    bodyLarge: MyTextStyles.bodyLarge,

    /// [Material] элэментүүдийн текстийн үндсэн стайл.
    bodyMedium: MyTextStyles.bodyMedium,

    /// Жижиг текст.
    bodySmall: MyTextStyles.bodySmall,

    /// Товчлуурын текстийн стайл.
    labelLarge: MyTextStyles.labelLarge,

    /// Хамгийн жижиг текст.
    labelSmall: MyTextStyles.labelSmall,
  );
}
