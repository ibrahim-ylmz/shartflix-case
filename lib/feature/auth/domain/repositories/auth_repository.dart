import 'package:shartflix_case/feature/auth/domain/entities/user_entity.dart';

/// Auth Repository interface for domain layer
abstract class AuthRepository {
  /// Login with email and password
  Future<UserEntity> login({required String email, required String password});

  /// Register with email, name and password
  Future<UserEntity> register({
    required String email,
    required String name,
    required String password,
  });
}
