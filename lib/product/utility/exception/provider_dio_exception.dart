class AppProviderDioException implements Exception {
  AppProviderDioException({
    required this.message,
  });

  final String message;

  @override
  String toString() {
    return 'Provider Dio Exception: $message';
  }
}
