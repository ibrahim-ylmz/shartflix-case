import 'package:dio/dio.dart';
import 'package:shartflix_case/core/network/exceptions/network_exceptions.dart';
import 'package:shartflix_case/core/network/manager/i_network_manager.dart';
import 'package:shartflix_case/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:shartflix_case/feature/auth/data/models/login_request_model.dart';
import 'package:shartflix_case/feature/auth/data/models/register_request_model.dart';
import 'package:shartflix_case/feature/auth/data/models/user_model.dart';

/// Auth Remote Data Source Implementation
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  /// Constructor
  AuthRemoteDataSourceImpl(this._networkManager);
  final INetworkManager _networkManager;

  @override
  Future<UserModel> login(LoginRequestModel request) async {
    try {
      return await _networkManager.post<UserModel>(
        '/user/login',
        data: request.toJson(),
        fromJsonT: UserModel.fromJson,
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> register(RegisterRequestModel request) async {
    try {
      return await _networkManager.post<UserModel>(
        '/user/register',
        data: request.toJson(),
        fromJsonT: UserModel.fromJson,
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
