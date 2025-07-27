import 'package:shartflix_case/feature/auth/data/models/login_request_model.dart';
import 'package:shartflix_case/feature/auth/data/models/register_request_model.dart';
import 'package:shartflix_case/feature/auth/data/models/user_model.dart';

/// Auth Remote Data Source
abstract class AuthRemoteDataSource {
  /// Login
  Future<UserModel> login(LoginRequestModel request);

  /// Register
  Future<UserModel> register(RegisterRequestModel request);
}
