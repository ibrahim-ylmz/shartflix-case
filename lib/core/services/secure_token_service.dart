import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shartflix_case/core/services/token_service.dart';

/// Secure implementation of TokenService using FlutterSecureStorage
final class SecureTokenService implements TokenService {
  /// Constructor
  const SecureTokenService(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const String _tokenKey = 'auth_token';

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> clearToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }
}
