import 'package:flutter/material.dart' show Color, Colors, immutable;

@immutable
abstract final class ProjectColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color amber = Colors.amber;
  static const Color red = Colors.red;
  static const Color lavender = Color(0xffDBE3FF);
  static const Color cobaltBlue = Color(0xff88A4E8);
  static const Color grey600 = Color(0xFF757575);
  static const Color greyText = Color(0xff9C9C9C);

  // Dark theme colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextColor = Colors.white;
  static const Color darkGreyText = Color(0xFFBDBDBD);
}
