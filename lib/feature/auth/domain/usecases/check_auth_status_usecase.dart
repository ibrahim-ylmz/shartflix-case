import 'package:shartflix_case/core/services/token_service.dart';

/// Use case to check if user is authenticated
final class CheckAuthStatusUseCase {
  /// Constructor
  const CheckAuthStatusUseCase(this._tokenService);

  final TokenService _tokenService;

  /// Check if user has valid authentication token
  Future<bool> call() async {
    return _tokenService.hasToken();
  }
}
