import 'package:flutter/material.dart';

class MyColors {
  ///Апп-ын үндсэн өнгө
  static const Color primaryColor = Color(0xff2FAD12);

  ///Апп-ын үндсэн өнгөний бараан хувилбар
  static const Color primaryColorDark = Color(0xff1E258B);

  ///Апп-ын үндсэн өнгөний цайвар хувилбар
  static const Color primaryColorLight = Color(0xff1E258B);

  ///Hint өнгө. [TextFormField]-ын hint болон placeholder-д ашиглагнадана
  static const Color hintColor = Color(0xff888a99);

  ///Апп-ын canvas-ийн background-д ашиглагдах өнгө
  static const Color backgroundColor = Color(0xFFF3F4F6);

  ///Апп-ын background-д ашиглагдах өнгө
  static const Color scaffoldBackgroundColor = Color(0xFFF3F4F6);

  /// [Divider], [PopupMenuDivider] болон [ListTile], [DataTable]-ын хуваагч
  /// зураасны өнгө
  static const Color dividerColor = Color(0xffbbbecd);

  ///Ямар ч үйлдэл хийх боломжгүй буюу бүрэн идэвхгүй болсон
  ///виджетүүдэд ашиглах өнгө
  static const Color disabledColor = Color(0xffeeeff2);

  ///Апп-д ямар нэг үйлдэл хийгээд амжилттай болсон тохоилдолд ашиглах өнгө
  static const Color? successColor = Color(0xff3abc5e);

  ///[TextField] гэх мэт виджетүүдэд алдааны мэдээлэл харуулахад ашиглах өнгө
  static const Color errorColor = Colors.red;

  ///Үйлдэл хийх боломтой ч сонгогдоогүй үед ашиглах өнгө
  ///
  /// [disabledColor]-г бодвол ямар нэг үйлдэл хийх боломжтой гэсэн үг
  static const Color unselectedWidgetColor = Color(0xff4e5562);

  ///[InkWell] зэрэг виджетүүд дээр дарахад харагдах
  ///цацрагын өнгө
  static const Color? splashColor = null;

  ///[BottomAppBar]-ын дэвсгэр өнгө
  static const Color? bottomAppBarColor = null;

  ///[Material] сангын [Card]-ны өнгө
  static const Color? cardColor = null;

  ///[TextFormField] гэх мэт ямарваа нэг input-ын фокус хийгдсэн үеийн өнгө.
  static const Color? focusColor = null;

  ///Хулганы заагч гэх мэт pointer-ууд тухайн виджет дээр очиход
  ///харагдах өнгө
  static const Color? hoverColor = null;

  ///[InkWell] болон түүнтэй төстэй виджетүүдийн цацраг явж
  ///байх үеийн дэвсгэр өнгө.
  ///Мөн сонгогдсон цэсний дэвсгэр өнгө
  static const Color? highlightColor = null;

  static const Color? selectedRowColor = null;

  ///[Material] сангын [MaterialType.canvas]-ийн өнгө.
  static const Color? canvasColor = null;

  ///[Material] сангын виджетүүдийн сүүдэрний өнгө
  ///
  /// Жишээ нь: [AppBar], [Card], [Container] гэх мэтийн сүүдэрний өнгө
  static const Color? shadowColor = null;

  ///[Dialog]-ийн арын дэвсгэр өнгө
  static const Color? dialogBackgroundColor = Color(0xFFF3F4F6);

  ///Нэмэлт өнгөнүүд. Апп-д ашигладаж байгаагаас тусдаа нэмэлт
  ///өнгө ашиглаж байгаа бол энэ хэсэгт тухайн өнгөө зарлана
  static const Color secondaryColor = Color(0xff2FA1D9);
  static const Color thirdColor = Color(0xff2FA1D9);
}
