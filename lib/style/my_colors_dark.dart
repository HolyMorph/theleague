import 'package:flutter/material.dart';

class MyColorsDark {
  ///Апп-ын үндсэн өнгө
  static const Color primaryColor = Colors.black54;

  ///Апп-ын үндсэн өнгөний бараан хувилбар
  static const Color primaryColorDark = Colors.black;

  ///Апп-ын үндсэн өнгөний цайвар хувилбар
  static const Color primaryColorLight = Colors.black26;

  ///Hint өнгө. [TextFormField]-ын hint болон placeholder-д ашиглагнадана
  static const Color hintColor = Colors.white54;

  ///Апп-ын canvas-ийн background-д ашиглагдах өнгө
  static const Color backgroundColor = Color(0xFFF3F4F6);

  ///Апп-ын background-д ашиглагдах өнгө
  static const Color scaffoldBackgroundColor = Color(0xFF444444);

  /// [Divider], [PopupMenuDivider] болон [ListTile], [DataTable]-ын хуваагч
  /// зураасны өнгө
  static const Color dividerColor = Color(0xffbbbecd);

  ///Ямар үйлдэл хийх боломжгүй буюу бүрэн идэвхгүй болсон
  ///виджетүүдэд ашиглах өнгө
  static const Color disabledColor = Colors.white10;

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

  ///InkWell болон түүнтэй төстэй виджетүүдийн цацраг явж
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
  static const Color? dialogBackgroundColor = null;

  ///Бараан загвар дээр цайвраар харагдах гол өнгө
  static const Color darkAccentColor = Colors.white;
}
