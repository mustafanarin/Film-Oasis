import 'package:flutter/material.dart' show BorderRadius, Radius;

enum RadiusValue {
  large(30),
  medium(25),
  small(20),
  xSmall(5);

  const RadiusValue(this.value);

  final double value;
}

final class AppRadius extends BorderRadius {
  AppRadius.xSmallCircular() : super.circular(RadiusValue.xSmall.value);
  AppRadius.smallCircular() : super.circular(RadiusValue.small.value);
  AppRadius.mediumCircular() : super.circular(RadiusValue.medium.value);
  AppRadius.smallTopVerical() : super.vertical(top: Radius.circular(RadiusValue.small.value));
  AppRadius.allLarge() : super.all(Radius.circular(RadiusValue.large.value));

}
