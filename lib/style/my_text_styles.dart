import 'package:flutter/material.dart';

class MyTextStyles {
  static const baseFont = '';

  //Апп-д ашиглагдаж буй текстүүдийн стайл

  ///Хамгийн том текст
  static TextStyle? headline1;

  ///Аварга том текст
  static TextStyle? headline2;

  ///Дунд зэрэг том текст
  static TextStyle? headline3;

  ///Бага зэрэг том текст
  static TextStyle? headline4;

  ///Том текст
  static TextStyle? headline5;

  ///[AppBar] болон [Dialog]-ийн гарчигны стайл
  static TextStyle? headline6;

  ///Үндсэн текстийн стайл. [TextFormField]-ийн бичсэн текст, [ListTile]-ийн гарчиг гэх мэтэд ашиглагдана
  static TextStyle? subtitle1;

  ///Дунд зэргийн хэмжээтэй текст. [subtitle1]-с арай бага хэмжээтэй байх ёстой
  static TextStyle? subtitle2;

  ///[bodyText2]-с арай том текстүүдэд ашиглах стайл
  static TextStyle? bodyText1;

  ///[Material] элэментүүдийн текстийн үндсэн стайл
  static TextStyle? bodyText2;

  ///Товчлуурын текстийн стайл
  static TextStyle? button;

  ///Жижиг текст
  static TextStyle? caption;

  ///Хамгийн жижиг текст
  static TextStyle? overline;

  ///[BottomNavigationBar]-ийн сонгогдсон Tab-ийн гарчигны загвар
  static TextStyle? selectedLabelStyle;

  ///[BottomNavigationBar] сонгогдоогүй Tab-ийн гарчигны загвар
  static TextStyle? unselectedLabelStyle;

  ///[TabBar]-ийн сонгогдсон Tab-ийн гарчигны загвар
  static TextStyle? selectedTabLabelStyle;

  ///[TabBar]-ийн сонгогдоогүй Tab-ийн гарчигны загвар
  static TextStyle? unselectedTabLabelStyle;
}
