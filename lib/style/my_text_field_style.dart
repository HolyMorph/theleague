import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_colors.dart';

//TextFormField-ийн стайл
//-------------------------------------------------------------------------

///[TextFormField]-ийн загварууд
class MyTextFieldStyle {
  //Доорх загваруудыг дезайнераас авах бөгөөд хэрвээ
  //ямар нэг утга өгөөгүй тохиолдолд default утгаараа харагдана.
  //Хэрвээ default утга нь гаргасан дезайнтай таарахгүй бол дезайн
  //хийж байгаа хүнээрээ стайл гаргуулах хэрэгтэй
  //----------------------------------------------------------

  /// TextForm дээрх текстийн уртыг харуулах текстийн загвар.
  static TextStyle? counterStyle;

  /// [TextFormField]-ийн алдааны мэссэжний загвар.
  static TextStyle? errorStyle;

  /// [TextFormField]-ийн тайлбар харуулах хэсгийн стайл.
  static TextStyle? hintStyle = TextStyle(color: Color(0xffA7A9B7), fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Avenir");

  /// TextFormField-ийн хүрээний загвар.
  static InputBorder inputBorder = OutlineInputBorder(
    borderSide: inputBorderSide,
    borderRadius: BorderRadius.circular(10),
  );

  /// TextFormField-ийн хүрээний зураасны загвар.
  static BorderSide inputBorderSide = BorderSide(
    color: Get.theme.primaryColor,
    width: 1,
    style: BorderStyle.solid,
  );

  /// [TextFormField]-ийн үндсэн стайл.
  static InputDecorationTheme inputTheme = InputDecorationTheme(
    /// Label болон hint-ийг зэрэгцүүлэх эсэх.
    alignLabelWithHint: false,
    isCollapsed: true,
    isDense: true,

    /// TextForm дээрх алдааны мэдээний стайл.
    errorStyle: errorStyle,

    /// TextForm дээрх текстийн уртыг харуулах текстийн стайл.
    counterStyle: counterStyle,

    /// TextForm-ийн арын дэвсгэрийг өнгөтэй харуулах эсэх.
    filled: false,

    ///TextForm-ийн арын дэвсгэрийн  өнгөтэй харуулах
    ///тохиолдолд тухайн өнгийг энэ утганд өгнө
    fillColor: null,

    ///Label-ийн харагдах тохиргоо.
    ///
    /// Focus хийгдэхэд дээшлэх, байнга дээр харагдах, эсвэл дээшлэхгүй гэх мэт тохиргоонууд байна
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    /// Дотоод контентийн зай авах хэмжээ.
    contentPadding: null,

    /// Энгийн үеийн хүрээ.
    border: inputBorder,

    /// Идэвхтэй үеийн хүрээ.
    enabledBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: Get.theme.dividerColor,
      ),
    ),

    /// Cursor идэвхтэй буюу Focus хийгдсэн үеийн хүрээ.
    focusedBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: MyColors.dividerColor,
      ),
    ),

    /// Алдаатай үеийн хүрээ.
    errorBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: Get.theme.colorScheme.error,
      ),
    ),

    /// Focus хийгдсэн мөн алдаатай өгөгдөл байгаа үеийн хүрээ.
    focusedErrorBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: Get.theme.colorScheme.error,
      ),
    ),

    /// Идэвхгүй болгосон үеийн хүрээ.
    disabledBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: Get.theme.disabledColor,
      ),
    ),

    /// Hint буюу зөвлөмж харуулах хэсгийн стайл.
    hintStyle: hintStyle,

    /// Label буюу юу оруулах гарчигны стайл.
    labelStyle: labelStyle,

    /// TextForm-ийн prefix нь текст үед тухайн текстийн стайл.
    prefixStyle: prefixStyle,

    /// Алдааны мсж-ны дээд мөрийн тоо.
    errorMaxLines: 1,

    /// Текстийн төгсгөлд харуулах текстийн загвар.
    suffixStyle: suffixStyle,

    /// Prefix нь icon буюу Widget үед тухайн icon-ы өнгө.
    prefixIconColor: null,

    /// Suffix нь icon буюу Widget үед тухайн icon-ы өнгө.
    suffixIconColor: null,
  );

  /// TextForm-ийн Label буюу юу гарчигны стайл.
  static TextStyle? labelStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "Avenir", color: Color(0xffA7A9B7));

  ///TextForm-ийн prefix нь текст үед тухайн текстийн стайл
  ///
  /// Жишээлбэл утасны дугаар оруулах хэсэгт урд талд нь автоматаар 976 гэж харуулах бол
  /// тухайн 976 гэсэн текстийн стайл гэсэн үг
  static TextStyle? prefixStyle;

  /// TextForm-ийн suffix нь текст үед тухайн текстийн стайл.
  static TextStyle? suffixStyle;
}
