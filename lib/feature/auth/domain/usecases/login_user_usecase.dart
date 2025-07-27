import 'package:shartflix_case/feature/auth/domain/entities/user_entity.dart';
import 'package:shartflix_case/feature/auth/domain/repositories/auth_repository.dart';

/// Use case for user login
class LoginUserUseCase {
  /// Constructor
  const LoginUserUseCase(this._authRepository);

  /// Auth repository instance
  final AuthRepository _authRepository;

  /// Execute login use case
  Future<UserEntity> call({required String email, required String password}) {
    return _authRepository.login(email: email, password: password);
  }
}
