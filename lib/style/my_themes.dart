import 'package:flutter/material.dart';
import 'package:mezorn_dummy/style/my_button_styles.dart';
import 'package:mezorn_dummy/style/my_colors.dart';
import 'package:mezorn_dummy/style/my_text_styles.dart';
import 'package:mezorn_dummy/style/my_textfield_styles.dart';

class MyThemes {
  ///[TabBar]-ийн загвар
  static TabBarTheme tabBarTheme = TabBarTheme(
    ///Tab-ын сонгогдсон гарчигны өнгө
    labelColor: MyColors.primaryColor,

    ///Tab-ын сонгогдсон гарчигны загвар
    labelStyle: MyTextStyles.selectedTabLabelStyle,

    ///Tab-ын сонгогдоогүй гарчигны өнгө
    unselectedLabelColor: MyColors.unselectedWidgetColor,

    ///Tab-ын сонгогдоогүй гарчигны загвар
    unselectedLabelStyle: MyTextStyles.unselectedTabLabelStyle,

    ///Indicator буюу TabBar-ийн доогуур гүйх зураасны загвар
    indicator: null,

    ///Indicator буюу TabBar-ийн доогуур гүйх зураасны хэмжээ
    indicatorSize: null,

    ///Гарчигны зай авах хэмжээ
    labelPadding: null,
  );

  ///[BottomNavigation]-ны загвар
  static BottomNavigationBarThemeData bottomNavigationBarTheme = BottomNavigationBarThemeData(
    ///Арын дэвсгэр өнгө
    backgroundColor: Colors.white,

    ///Товгорын хэмжээ
    elevation: 0,

    ///Сонгогдсон гарчигийг харуулах эсэх
    showSelectedLabels: false,

    ///Сонгогдоогүй гарчигийг харуулах эсэх
    showUnselectedLabels: false,

    ///Төрөл. Бүгд тэнцүү зайгаа хувааж авах эсвэл сонгогдсон нь арай илүү зай эзлэх гэх мэт
    type: BottomNavigationBarType.fixed,

    ///Сонгогдсон Tab-ийн Icon болон текстийн өнгө
    selectedItemColor: MyColors.primaryColor,

    ///Сонгогдоогүй Tab-ийн Icon болон текстийн өнгө
    unselectedItemColor: MyColors.unselectedWidgetColor,

    ///Сонгогдсон Tab-ийн Icon-ны загвар
    selectedIconTheme: const IconThemeData(color: MyColors.primaryColor),

    ///Сонгогдоогүй Tab-ийн Icon-ны загвар
    unselectedIconTheme: const IconThemeData(color: MyColors.unselectedWidgetColor),

    ///Сонгогдсон Tab-ийн гарчигны загвар
    selectedLabelStyle: MyTextStyles.selectedLabelStyle,

    ///Сонгогдоогүй Tab-ийн гарчигны загвар
    unselectedLabelStyle: MyTextStyles.unselectedLabelStyle,
  );

  ///Апп-ын [AppBar]-ийн загвар
  static AppBarTheme appBarTheme = const AppBarTheme(
    ///Дэвсгэр өнгө.
    backgroundColor: MyColors.primaryColor,

    ///Товгорын хэмжээ 0-с их тохиолдолд ард нь тусах сүүдрийн өнгө
    shadowColor: MyColors.shadowColor,

    ///Өндрийн хэмжээ
    toolbarHeight: null,

    ///Actions буюу меню байгаа бол тухайн менюны загвар
    actionsIconTheme: null,

    ///AppBar-ийн гарчиг төвдөө харагдах эсэх
    centerTitle: false,

    ///[AppBar]-ийн буцах болон burger цэсний загвар
    iconTheme: null,

    ///AppBar-ийн хэлбэр. Дугуй хүрээтэй байх эсэх нтр гээд
    shape: null,

    ///AppBar-ийн гарчигны загвар
    titleTextStyle: null,

    ///AppBar-ийн товгорын хэмжээ
    elevation: 0,
  );

  ///Апп-д ашиглах текстүүдийн стайл
  static TextTheme textTheme = TextTheme(
    ///Үлэмж том текст
    headline1: MyTextStyles.headline1,

    ///Аварга том текст
    headline2: MyTextStyles.headline2,

    ///Дунд зэрэг том текст
    headline3: MyTextStyles.headline3,

    ///Жоохон том текст
    headline4: MyTextStyles.headline4,

    ///Том текст
    headline5: MyTextStyles.headline5,

    ///[AppBar] болон [Dialog]-ийн гарчигны стайл
    headline6: MyTextStyles.headline6,

    ///Үндсэн текстийн стайл. [TextForm]-ийн бичсэн текст, [ListTile]-ийн гарчиг гэх мэтэд ашиглагдана
    subtitle1: MyTextStyles.subtitle1,

    ///Дунд зэргийн хэмжээтэй текст. [subtitle1]-с арай бага хэмжээтэй байх ёстой
    subtitle2: MyTextStyles.subtitle2,

    ///[bodyText2]-с арай том текстүүдэд ашиглах стайл
    bodyText1: MyTextStyles.bodyText1,

    ///[Material] элэментүүдийн текстийн үндсэн стайл
    bodyText2: MyTextStyles.bodyText2,

    ///Товчлуурын текстийн стайл
    button: MyTextStyles.button,

    ///Жижиг текст
    caption: null,

    ///Хамгийн жижиг текст
    overline: null,
  );

  static ThemeData mainTheme = ThemeData(
    ///Апп-д ашиглагдах нийт өнгөнүүд тохируулах
    primaryColor: MyColors.primaryColor,
    primaryColorLight: MyColors.primaryColorLight,
    primaryColorDark: MyColors.primaryColorDark,
    scaffoldBackgroundColor: MyColors.scaffoldBackgroundColor,
    unselectedWidgetColor: MyColors.unselectedWidgetColor,
    disabledColor: MyColors.disabledColor,
    hintColor: MyColors.hintColor,
    errorColor: MyColors.errorColor,
    backgroundColor: MyColors.backgroundColor,
    dividerColor: MyColors.dividerColor,
    splashColor: MyColors.splashColor,
    bottomAppBarColor: MyColors.bottomAppBarColor,
    cardColor: MyColors.cardColor,
    focusColor: MyColors.focusColor,
    hoverColor: MyColors.hoverColor,
    highlightColor: MyColors.highlightColor,
    selectedRowColor: MyColors.selectedRowColor,
    canvasColor: MyColors.canvasColor,

    ///Апп-ын нийт сүүдэрний өнгө
    shadowColor: MyColors.shadowColor,

    ///Dialog-ийн арын дэвсгэр өнгө
    dialogBackgroundColor: MyColors.dialogBackgroundColor,

    ///CheckBox, Radio гэх мэт тийм үгүй гэсэн сонголттой виджетүүдийн идэвхтэй үеийн өнгө
    toggleableActiveColor: MyColors.primaryColor,

    ///
    visualDensity: VisualDensity.adaptivePlatformDensity,

    ///Апп-ны хэмжээнд ашиглагдах үндсэн фонт. Custom фонт бол pubspec.yaml дотор зааж өгсөн байх шаардлагатай
    fontFamily: MyTextStyles.baseFont,

    ///BottomNavigation-ны загвар
    bottomNavigationBarTheme: bottomNavigationBarTheme,

    ///[TextFormField] болон [SelectableText]-ийн select хийх загвар
    ///
    ///Select хийх cursor-ийн өнгө, чирэх бондгорын өнгө гэх мэт
    textSelectionTheme: null,

    ///[DiaLog]-ийн загвар
    dialogTheme: null,

    ///Доороос гарч ирдэг bottomSheet-ийн загвар
    bottomSheetTheme: null,

    ///Доор харагддаг AppBar-ийн загвар
    bottomAppBarTheme: null,

    ///ТabBar-ийн загвар
    tabBarTheme: tabBarTheme,

    ///Хуудас шилжилтийн загвар
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    ///[AppBar]-ийн загвар
    appBarTheme: appBarTheme,

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
    checkboxTheme: null,

    ///SnackBar-ийн загвар
    snackBarTheme: null,

    ///Divider виджетийн загвар
    dividerTheme: null,

    ///Progress-уудын загвар.
    ///Linear, Circular болон Refresh-ийн загварууд энд сольж өгнө
    progressIndicatorTheme: null,

    ///ListTile-ийн загвар
    listTileTheme: null,

    ///Chip виджетийн загвар
    chipTheme: null,

    ///Гадуураа хүрээтэй товчлуурын загвар
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: MyButtonStyles.outlinedButtonStyle,
    ),

    ///Текстэн товчлуурын загвар
    textButtonTheme: TextButtonThemeData(
      style: MyButtonStyles.textButtonStyle,
    ),

    ///ElevatedButton-ны загвар
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: MyButtonStyles.buttonStyle,
    ),

    ///TextForm үндсэн стайл
    inputDecorationTheme: MyTextFieldStyles.inputTheme,

    ///Апп-д ашиглах текстүүдийн стайл
    textTheme: textTheme,
  );

  static ThemeData darkTheme = mainTheme.copyWith();
}
