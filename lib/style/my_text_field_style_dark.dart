import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_colors_dark.dart';
import 'my_text_field_style.dart';

//TextFormField-ийн стайл
//-------------------------------------------------------------------------

///[TextFormField]-ийн бараан загварууд
class MyTextFieldStyleDark {
  //Доорх загваруудыг дезайнераас авах бөгөөд хэрвээ
  //ямар нэг утга өгөөгүй тохиолдолд default утгаараа харагдана.
  //Хэрвээ default утга нь гаргасан дезайнтай таарахгүй бол дезайн
  //хийж байгаа хүнээрээ стайл гаргуулах хэрэгтэй
  //----------------------------------------------------------

  /// TextFormField-ийн хүрээний загвар.
  static InputBorder inputBorder = OutlineInputBorder(
    borderSide: inputBorderSide,
    borderRadius: BorderRadius.circular(10),
  );

  /// TextFormField-ийн хүрээний зураасны загвар.
  static BorderSide inputBorderSide = const BorderSide(
    color: MyColorsDark.darkAccentColor,
    width: 1,
    style: BorderStyle.solid,
  );

  //----------------------------------------------------------

  ///[TextFormField]-ийн үндсэн стайл
  static InputDecorationTheme inputTheme = InputDecorationTheme(
    /// Label болон hint-ийг зэрэгцүүлэх эсэх.
    alignLabelWithHint: false,
    isCollapsed: true,
    isDense: true,

    iconColor: MyColorsDark.darkAccentColor,

    hoverColor: MyColorsDark.darkAccentColor,

    /// TextForm дээрх алдааны мэдээний стайл.
    errorStyle: MyTextFieldStyle.errorStyle,

    /// TextForm дээрх текстийн уртыг харуулах текстийн стайл.
    counterStyle: MyTextFieldStyle.counterStyle,

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

    /// Focus хийгдсэн мөн алдаатай өгөгдөл байгаа үеийн хүрээ.
    focusedErrorBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: Get.theme.colorScheme.error,
      ),
    ),

    /// Идэвхтэй үеийн хүрээ.
    enabledBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: MyColorsDark.darkAccentColor.withOpacity(0.3),
      ),
    ),

    focusColor: MyColorsDark.darkAccentColor,

    /// Cursor идэвхтэй буюу Focus хийгдсэн үеийн хүрээ.
    focusedBorder: inputBorder.copyWith(
      borderSide: inputBorderSide.copyWith(
        color: MyColorsDark.darkAccentColor,
      ),
    ),

    /// Алдаатай үеийн хүрээ.
    errorBorder: inputBorder.copyWith(
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
    hintStyle: MyTextFieldStyle.hintStyle,

    /// Label буюу юу оруулах гарчигны стайл.
    labelStyle: (MyTextFieldStyle.labelStyle ?? const TextStyle()).copyWith(
      color: MyColorsDark.darkAccentColor,
    ),

    /// TextForm-ийн prefix нь текст үед тухайн текстийн стайл.
    prefixStyle: (MyTextFieldStyle.prefixStyle ?? const TextStyle()).copyWith(
      color: MyColorsDark.darkAccentColor,
    ),

    /// Алдааны мсж-ны дээд мөрийн тоо.
    errorMaxLines: 1,

    /// Текстийн төгсгөлд харуулах текстийн загвар.
    suffixStyle: (MyTextFieldStyle.suffixStyle ?? const TextStyle()).copyWith(
      color: MyColorsDark.darkAccentColor,
    ),

    /// Prefix нь icon буюу Widget үед тухайн icon-ы өнгө.
    prefixIconColor: MyColorsDark.darkAccentColor,

    /// Suffix нь icon буюу Widget үед тухайн icon-ы өнгө.
    suffixIconColor: MyColorsDark.darkAccentColor,
  );
}
