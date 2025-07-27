import 'package:shartflix_case/feature/auth/domain/entities/user_entity.dart';
import 'package:shartflix_case/feature/auth/domain/repositories/auth_repository.dart';

/// Use case for user registration
class RegisterUserUseCase {
  /// Constructor
  const RegisterUserUseCase(this._authRepository);

  /// Auth repository instance
  final AuthRepository _authRepository;

  /// Execute register use case
  Future<UserEntity> call({
    required String email,
    required String name,
    required String password,
  }) {
    return _authRepository.register(
      email: email,
      name: name,
      password: password,
    );
  }
}
