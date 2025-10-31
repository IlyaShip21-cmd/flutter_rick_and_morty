import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static TextStyle selectStyle({
    double fontSize = 16,
    Color color = Colors.black,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w900,
    double? height,
  }) => TextStyle(
    fontSize: fontSize,
    color: color,
    decorationColor: color,
    fontWeight: fontWeight,
    decoration: textDecoration,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    height: height,
  );

  static TextStyle unSelectStyle({
    double fontSize = 14,
    Color color = Colors.grey,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w500,
    double? height,
  }) => TextStyle(
    fontSize: fontSize,
    color: color,
    decorationColor: color,
    fontWeight: fontWeight,
    decoration: textDecoration,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    height: height,
  );

  static TextStyle forTitle({
    double fontSize = 20,
    Color color = Colors.black,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w600,
    double? height,
  }) => TextStyle(
    fontSize: fontSize,
    color: color,
    decorationColor: color,
    fontWeight: fontWeight,
    decoration: textDecoration,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    height: height,
  );

  static TextStyle forSubtitle({
    double fontSize = 16,
    Color color = Colors.grey,
    TextDecoration? textDecoration,
    double? letterSpacing,
    FontStyle? fontStyle,
    FontWeight fontWeight = FontWeight.w400,
    double? height,
  }) => TextStyle(
    fontSize: fontSize,
    color: color,
    decorationColor: color,
    fontWeight: fontWeight,
    decoration: textDecoration,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    height: height,
  );
}
