import 'package:flutter/material.dart' show BuildContext, Color, EdgeInsets, MediaQuery, TextTheme, Theme;

extension BuildContextExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.sizeOf(this).height * value;
  double dynamicWidth(double value) => MediaQuery.sizeOf(this).width * value;

  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }

  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;
}

extension NumberExtension on BuildContext {
  double get lowValue1 => dynamicHeight(0.01);
  double get lowValue2 => dynamicHeight(0.02);
  double get mediumValue => dynamicHeight(0.03);
  double get highValue => dynamicHeight(0.05);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow1 => EdgeInsets.all(lowValue1);
  EdgeInsets get paddingAllLow2 => EdgeInsets.all(lowValue2);
  EdgeInsets get paddingHorizantalLow2 => EdgeInsets.symmetric(horizontal: lowValue2);
  EdgeInsets get paddingHorizantalMedium => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingVerticalLow1 => EdgeInsets.symmetric(vertical: lowValue1);
  EdgeInsets get paddingVerticalLow2 => EdgeInsets.symmetric(vertical: lowValue2);
}
