enum DurationValues {
  smallMilliSeconds(300),
  mediumMilliSeconds(500),
  one(1),
  two(2),
  three(3);

  const DurationValues(this.value);

  final int value;
}

final class AppDuration extends Duration {
  AppDuration.smallMilliSeconds() : super(milliseconds: DurationValues.smallMilliSeconds.value);
  AppDuration.mediumMilliSeconds() : super(milliseconds: DurationValues.mediumMilliSeconds.value);
  AppDuration.oneSeconds() : super(seconds: DurationValues.one.value);
  AppDuration.twoSeconds() : super(seconds: DurationValues.two.value);
  AppDuration.threeSeconds() : super(seconds: DurationValues.three.value);
  AppDuration.threeDays() : super(days: DurationValues.three.value);
}
