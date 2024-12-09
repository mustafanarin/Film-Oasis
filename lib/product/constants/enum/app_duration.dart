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
  AppDuration.SmallMilliSeconds() : super(milliseconds: DurationValues.smallMilliSeconds.value);
  AppDuration.MediumMilliSeconds() : super(milliseconds: DurationValues.mediumMilliSeconds.value);
  AppDuration.OneSeconds() : super(seconds: DurationValues.one.value);
  AppDuration.TwoSeconds() : super(seconds: DurationValues.two.value);
  AppDuration.ThreeSeconds() : super(seconds: DurationValues.three.value);
  AppDuration.ThreeDays() : super(days: DurationValues.three.value);
}
