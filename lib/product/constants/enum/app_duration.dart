enum AppDuration {
  smallMilliSeconds(300),
  mediumMilliSeconds(500),
  one(1),
  two(2),
  three(3);

  const AppDuration(this.value);

  final int value;
}
