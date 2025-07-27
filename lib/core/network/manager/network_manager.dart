import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shartflix_case/core/network/config/network_config.dart';
import 'package:shartflix_case/core/network/exceptions/network_exceptions.dart';
import 'package:shartflix_case/core/network/interceptors/network_interceptor.dart';
import 'package:shartflix_case/core/network/manager/i_network_manager.dart';
import 'package:shartflix_case/core/network/models/base_response_model.dart';

/// This is the implementation of the INetworkManager interface.
final class NetworkManager implements INetworkManager {
  /// Constructor for the ApiClientImpl.
  NetworkManager(this._secureStorage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: NetworkConfig.baseUrl,
        connectTimeout: NetworkConfig.connectTimeout,
        receiveTimeout: NetworkConfig.receiveTimeout,
        contentType: Headers.jsonContentType,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    _dio.interceptors.add(NetworkInterceptor(_secureStorage));
  }

  /// Dio instance.
  late final Dio _dio;

  /// FlutterSecureStorage instance.
  final FlutterSecureStorage _secureStorage;

  @override
  Dio get dio => _dio;

  @override
  Future<T> get<T>(
    String path, {
    required T Function(Object? json) fromJsonT,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      final baseResponse = BaseResponseModel.fromJson(
        response.data!,
        fromJsonT,
      );
      return baseResponse.data;
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<T> post<T>(
    String path, {
    required T Function(Object? json) fromJsonT,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      final baseResponse = BaseResponseModel.fromJson(
        response.data!,
        fromJsonT,
      );
      return baseResponse.data;
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
