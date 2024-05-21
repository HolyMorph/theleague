import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'my_colors.dart';

///This class is for put label text inside the text field border
class MyTextFieldBorder extends OutlineInputBorder {
  const MyTextFieldBorder({
    BorderSide borderSide = const BorderSide(
      color: MyColors.grey300,
      width: 1,
      strokeAlign: BorderSide.strokeAlignCenter,
    ),
    BorderRadius borderRadius = const BorderRadius.all(
      Radius.circular(borderRadiusValue),
    ),
  }) : super(borderSide: borderSide, borderRadius: borderRadius);

  static const double borderRadiusValue = 8;

  @override
  bool get isOutline => false;

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.only(bottom: borderSide.width);
  }

  @override
  MyTextFieldBorder scale(double t) {
    return MyTextFieldBorder(borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(Rect.fromLTWH(rect.left, rect.top, rect.width, math.max(0.0, rect.height - borderSide.width)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is MyTextFieldBorder) {
      return MyTextFieldBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
      );
    }

    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is MyTextFieldBorder) {
      return MyTextFieldBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
      );
    }

    return super.lerpTo(b, t);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final Paint paint = borderSide.toPaint();
    final RRect outer = borderRadius.toRRect(rect);
    final RRect center = outer.deflate(borderSide.width / 2.0);

    if (!(gapStart == null || gapExtent <= 0.0 || gapPercentage == 0.0)) {
      ///Draw a shadow
      Path path = Path();
      final RRect shadowRect = RRect.fromLTRBR(0, 0, outer.right, outer.bottom, const Radius.circular(borderRadiusValue));
      path.addRRect(shadowRect);
      canvas.drawShadow(path, Colors.grey.withOpacity(0.7), 2, false);
    }

    ///Draw a white background
    final RRect fillRect = RRect.fromLTRBR(0, 0, outer.right, outer.bottom, const Radius.circular(borderRadiusValue));
    canvas.drawRRect(fillRect, Paint()..color = Colors.white);

    canvas.drawRRect(center, paint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is InputBorder && other.borderSide == borderSide;
  }

  @override
  int get hashCode => borderSide.hashCode;
}
