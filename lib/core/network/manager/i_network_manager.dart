import 'package:dio/dio.dart';

/// This is the interface for the network manager.
abstract class INetworkManager {
  /// Dio instance.
  Dio get dio;

  /// General GET request.
  Future<T> get<T>(
    String path, {
    required T Function(Object? json) fromJsonT,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  /// General POST request.
  Future<T> post<T>(
    String path, {
    required T Function(Object? json) fromJsonT,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
