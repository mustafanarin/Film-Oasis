class ProviderHiveException implements Exception {
  ProviderHiveException(this.message);

  final String message;

  @override
  String toString() {
    return 'Provider Hive Exception: $message';
  }
}
