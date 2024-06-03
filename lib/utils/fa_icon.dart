import 'package:flutter/material.dart';

const fontName = 'Font_Awesome_6_Pro';

class FaIcon {
  ///Энэ утгууд нь зөвхөн FontAwesome6Pro -д ашиглах боломжтой keys байна.
  ///Аль болох fontawesome icon ашиглаарай,
  ///олдохгүй бол https://fontawesome.com/search ороод боломжит keyword оор хайж үр дүнгийн оруулаарай.
  ///variable name must be exact font name

  static const String iconChevronRight = '\uf054';
  static const String iconChevronUp = '\uf077';
  static const String iconChevronDown = '\uf078';
  static const String trash = '\uf2ed';
  static const String email = '\uf0e0';
  static const String comment = '\uf075';
  static const String bell = '\uf0f3';
  static const String phone = '\uf095';
  static const String gear = '\uf013';
  static const String family = '\ue300';
  static const String quit = '\uf08b';
  static const String gift = '\uf06b';
  static const String taxi = '\uf1ba';
  static const String building = '\uf1ad';
  static const String house = '\uf015';
  static const String ticket = '\uf145';
  static const String wallet = '\uf555';
  static const String question = '\u003f';
  static const String clock = '\uf017';
  static const String copy = '\uf0c5';
  static const String pen = '\uf304';
  static const String user = '\uf007';
  static const String receipt = '\uf543';
  static const String location = '\uf3c5';
  static const String circleQuestion = '\uf059';
  static const String circleInfo = '\uf05a';
  static const String circlePlus = '\uf055';
  static const String creditCard = '\uf09d';
  static const String edit = '\uf044';
  static const String user_group = '\uf500';
  static const String user_medical = '\uf830';
  static const String user_edit = '\uf4ff';
  static const String location_dot = '\uf3c5';
  static const String key = '\uf084';
  static const String eye = '\uf06e';
  static const String eyeSlash = '\uf070';
  static const String heart = '\uf004';
  static const String trophy = '\uf091';
  static const String medal = '\uf5a2';
  static const String upload_cloud = '\uf0ee';
  static const String image = '\uf03e';
  static const String camera = '\uf030';
  static const String lock = '\uf30d';
  static const String inbox = '\uf01c';
  static const String search = '\uf002';
  static const String calendar = '\uf133';

  ///For proper use
  ///Light style tai, w300 icon bol faLight
  ///Regular style tai, w400 icon bol faRegular
  ///Solid style tai, w900 icon bol faSolid,
  ///color utga oruulaagui bol defaultaar har ungutei baina
  ///fontsize iig size aar oruulna. default value 12
  ///
  static TextStyle light({Color color = Colors.black, double size = 12}) =>
      TextStyle(fontFamily: fontName, fontWeight: FontWeight.w300, fontSize: size, color: color);

  static TextStyle regular({Color color = Colors.black, double size = 12}) =>
      TextStyle(fontFamily: fontName, fontWeight: FontWeight.w400, fontSize: size, color: color);

  static TextStyle solid({Color color = Colors.black, double size = 12}) =>
      TextStyle(fontFamily: fontName, fontWeight: FontWeight.w900, fontSize: size, color: color);
}
