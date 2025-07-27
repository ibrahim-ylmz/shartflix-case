import 'package:shartflix_case/core/services/token_service.dart';

/// Use case to logout user by clearing stored token
final class LogoutUserUseCase {
  /// Constructor
  const LogoutUserUseCase(this._tokenService);

  final TokenService _tokenService;

  /// Logout user by clearing authentication token
  Future<void> call() async {
    await _tokenService.clearToken();
  }
}
