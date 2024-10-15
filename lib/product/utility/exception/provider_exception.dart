class ProviderException implements Exception {
  ProviderException({
    required this.message,
  });

  final String message;

  @override
  String toString() {
    return 'Provider Dio Exception: $message';
  }
}
