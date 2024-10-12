import 'package:flutter/material.dart' show Color, Colors, immutable;

@immutable
abstract final class ProjectColors {
  const ProjectColors._(); 
  
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color lavender = Color(0xffDBE3FF);
  static const Color cobaltBlue = Color(0xff88A4E8);
  static const Color grey600 = Color(0xFF757575);
}
