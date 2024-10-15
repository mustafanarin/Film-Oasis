class AppProviderException implements Exception {
  AppProviderException({
    required this.message,
  });

  final String message;

  @override
  String toString() {
    return 'Provider Dio Exception: $message';
  }
}
