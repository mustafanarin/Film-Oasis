
class MyDioException implements Exception{
  MyDioException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
  
  @override
  String toString() {
    return 'Dio exception: $message (Status code: $statusCode)';
  }
}