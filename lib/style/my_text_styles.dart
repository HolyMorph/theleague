import 'package:flutter/material.dart';

class MyTextStyles {
  static const baseFont = 'GIP';

  //Апп-д ашиглагдаж буй текстүүдийн стайл

  /// [bodyLarge]-с арай том текстүүдэд ашиглах стайл.
  static TextStyle? appBarTitleStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle? bodyLarge;

  /// [Material] элэментүүдийн текстийн үндсэн стайл.
  static TextStyle? bodyMedium;

  /// Жижиг текст.
  static TextStyle? bodySmall = TextStyle(color: Color(0xff666876), fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Outfit");

  /// Жижиг текст гэхдээ арай хар.
  static TextStyle? bodySmallBlack = TextStyle(color: Color(0xff191D31), fontWeight: FontWeight.w400, fontSize: 16, fontFamily: "Outfit");

  static TextStyle disabledStyle = TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16, fontWeight: FontWeight.w600);

  /// Хамгийн том текст.
  static TextStyle? displayLarge;

  /// Аварга том текст.
  static TextStyle? displayMedium = TextStyle(color: Color(0xff000000), fontSize: 18, fontWeight: FontWeight.w400, fontFamily: "Avenir");

  /// Дунд зэрэг том текст.
  static TextStyle? displaySmall = TextStyle(color: Color(0xff191D31), fontSize: 16, fontWeight: FontWeight.w900, fontFamily: "Avenir");

  /// Бага зэрэг том текст.
  static TextStyle? headlineMedium = TextStyle(color: Color(0xff191D31), fontSize: 20, fontWeight: FontWeight.w900, fontFamily: "Avenir");

  /// Том текст.
  static TextStyle? headlineSmall = TextStyle(color: Color(0xffA7A9B7), fontWeight: FontWeight.w400, fontFamily: "Avenir", fontSize: 14);

  /// Товчлуурын текстийн стайл.
  static TextStyle? labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  /// Хамгийн жижиг текст.
  static TextStyle? labelSmall = TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18);

  /// name
  static TextStyle? name = TextStyle(color: Color(0xff191D31), fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "Avenir");

  /// [BottomNavigationBar]-ийн сонгогдсон Tab-ийн гарчигны загвар.
  static TextStyle? selectedLabelStyle;

  /// [TabBar]-ийн сонгогдсон Tab-ийн гарчигны загвар.
  static TextStyle? selectedTabLabelStyle;

  /// [AppBar] болон [Dialog]-ийн гарчигны стайл.
  static TextStyle? titleLarge;

  /// Үндсэн текстийн стайл. [TextFormField]-ийн бичсэн текст, [ListTile]-ийн гарчиг гэх мэтэд ашиглагдана.
  static TextStyle? titleMedium;

  /// Дунд зэргийн хэмжээтэй текст.
  static TextStyle? titleSmall = TextStyle(color: Color(0xff191D31), fontSize: 16, fontWeight: FontWeight.w900, fontFamily: "Avenir");

  /// [BottomNavigationBar] сонгогдоогүй Tab-ийн гарчигны загвар.
  static TextStyle? unselectedLabelStyle;

  /// [TabBar]-ийн сонгогдоогүй Tab-ийн гарчигны загвар.
  static TextStyle? unselectedTabLabelStyle;
}
