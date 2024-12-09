import 'package:flutter/material.dart' show EdgeInsets;

enum PaddingValue {
  normal(10),
  zero(0);

  const PaddingValue(this.value);

  final double value;
}

// for theme
final class AppPadding extends EdgeInsets {
  AppPadding.symmetric() : super.symmetric(
          horizontal: PaddingValue.normal.value,
          vertical: PaddingValue.zero.value,
        );
}
