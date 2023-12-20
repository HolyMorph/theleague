import 'package:flutter/material.dart';

class MyColors {
  static const Color LightModeBlack02 = Color(0xff666876);

  static const Color LightModeBlack03 = Color(0xff8C8E98);

  /// Апп-ын canvas-ийн background-д ашиглагдах өнгө.
  static const Color backgroundColor = Color(0xff161623);

  /// [BottomAppBar]-ын дэвсгэр өнгө.
  static const Color? bottomAppBarColor = null;

  static const Color buttonBackColor = Color(0xffEAECF0);
  static const Color buttonColor = Color(0xff4D5163);

  static const Color buttonDisabledColor = Color(0xffFF8D62);

  /// [Material] сангын [MaterialType.canvas]-ийн өнгө.
  static const Color? canvasColor = Color(0xff191D31);

  /// [Material] сангын [Card]-ны өнгө.
  static const Color cardColor = Color(0xffF3F3F3);

  /// [Dialog]-ийн арын дэвсгэр өнгө.
  static const Color? dialogBackgroundColor = Color(0xFFF3F4F6);

  ///Ямар ч үйлдэл хийх боломжгүй буюу бүрэн идэвхгүй болсон
  ///виджетүүдэд ашиглах өнгө
  static const Color disabledColor = Color(0xffbbbecd);

  /// [Divider], [PopupMenuDivider] болон [ListTile], [DataTable]-ын хуваагч
  /// зураасны өнгө
  static const Color dividerColor = Color(0xff1D272F);

  /// [TextField] гэх мэт виджетүүдэд алдааны мэдээлэл харуулахад ашиглах өнгө.
  static const Color errorColor = Color(0xffFF4C4D);

  /// [TextFormField] гэх мэт ямарваа нэг input-ын фокус хийгдсэн үеийн өнгө.
  static const Color? focusColor = null;

  ///[InkWell] болон түүнтэй төстэй виджетүүдийн цацраг явж
  ///байх үеийн дэвсгэр өнгө.
  ///Мөн сонгогдсон цэсний дэвсгэр өнгө
  static const Color? highlightColor = null;

  /// Hint өнгө. [TextFormField]-ын hint болон placeholder-д ашиглагнадана.
  static const Color hintColor = Color(0xff888a99);

  ///Хулганы заагч гэх мэт pointer-ууд тухайн виджет дээр очиход
  ///харагдах өнгө
  static const Color? hoverColor = null;

  /// Апп-ын үндсэн өнгө.
  static const Color primaryColor = Color(0xff0F0F17);

  /// Апп-ын үндсэн өнгөний бараан хувилбар.
  static const Color primaryColorDark = Color(0xff1E258B);

  /// Апп-ын үндсэн өнгөний цайвар хувилбар.
  static const Color primaryColorLight = Color(0xff1E258B);
  static const Color redColor = Color(0xffF41435);

  /// Апп-ын background-д ашиглагдах өнгө.
  static const Color scaffoldBackgroundColor = Color(0xffF8F9FA);

  ///Нэмэлт өнгөнүүд. Апп-д ашигладаж байгаагаас тусдаа нэмэлт
  ///өнгө ашиглаж байгаа бол энэ хэсэгт тухайн өнгөө зарлана
  static const Color secondaryColor = Color(0xffFF4800);

  static const Color? selectedRowColor = null;

  ///[Material] сангын виджетүүдийн сүүдэрний өнгө
  ///
  /// Жишээ нь: [AppBar], [Card], [Container] гэх мэтийн сүүдэрний өнгө
  static const Color shadowColor = Color(0xffF5F5F5);

  ///[InkWell] зэрэг виджетүүд дээр дарахад харагдах
  ///цацрагын өнгө
  static const Color? splashColor = null;

  /// Апп-д ямар нэг үйлдэл хийгээд амжилттай болсон тохоилдолд ашиглах өнгө.
  static const Color? successColor = Color(0xff3abc5e);

  static const Color thirdColor = Color(0xffA7A9B7);

  ///Үйлдэл хийх боломтой ч сонгогдоогүй үед ашиглах өнгө
  ///
  /// [disabledColor]-г бодвол ямар нэг үйлдэл хийх боломжтой гэсэн үг
  static const Color unselectedWidgetColor = Color(0xff4e5562);
}
