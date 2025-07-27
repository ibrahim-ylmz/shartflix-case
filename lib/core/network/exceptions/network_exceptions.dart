import 'package:dio/dio.dart';

/// Exception thrown when a server error occurs.
class ServerException implements Exception {
  /// Creates a [ServerException] with an optional message.
  const ServerException([this.message = 'Unknown network error']);

  /// The error message
  factory ServerException.fromDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerException('Connection timeout.');
      case DioExceptionType.cancel:
        return const ServerException('Request to server was cancelled.');
      case DioExceptionType.badCertificate:
        return const ServerException('Bad SSL certificate.');
      case DioExceptionType.connectionError:
        return const ServerException('Connection error.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 400:
            return const ServerException('Email or password is incorrect');
          case 401:
            return const ServerException('Unauthorized (401).');
          case 403:
            return const ServerException('Forbidden (403).');
          case 404:
            return const ServerException('Not found (404).');
          case 500:
            return const ServerException('Internal server error (500).');
          default:
            return ServerException(
              'Received invalid status code: ${statusCode ?? 'unknown'}',
            );
        }
      case DioExceptionType.unknown:
        return ServerException(error.message ?? 'Unknown error');
    }
  }

  /// The error message.
  final String message;

  @override
  String toString() => 'ServerException: $message';
}
