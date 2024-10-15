class AppDioException implements Exception {
  AppDioException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() {
    return 'Dio exception: $message (Status code: $statusCode)';
  }
}
