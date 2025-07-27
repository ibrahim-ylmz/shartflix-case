import 'package:shartflix_case/core/services/token_service.dart';
import 'package:shartflix_case/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:shartflix_case/feature/auth/data/models/login_request_model.dart';
import 'package:shartflix_case/feature/auth/data/models/register_request_model.dart';
import 'package:shartflix_case/feature/auth/domain/entities/user_entity.dart';
import 'package:shartflix_case/feature/auth/domain/repositories/auth_repository.dart';

/// Auth Repository Implementation
class AuthRepositoryImpl implements AuthRepository {
  /// Constructor
  AuthRepositoryImpl(this._remoteDataSource, this._tokenService);
  
  final AuthRemoteDataSource _remoteDataSource;
  final TokenService _tokenService;

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequestModel(email: email, password: password);
    final response = await _remoteDataSource.login(request);
    final userEntity = response.toEntity();
    
    // Save token securely after successful login
    await _tokenService.saveToken(userEntity.token);
    
    return userEntity;
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String name,
    required String password,
  }) async {
    final request = RegisterRequestModel(
      email: email,
      name: name,
      password: password,
    );

    final userModel = await _remoteDataSource.register(request);
    final userEntity = userModel.toEntity();
    
    // Save token securely after successful registration
    await _tokenService.saveToken(userEntity.token);
    
    return userEntity;
  }
}
