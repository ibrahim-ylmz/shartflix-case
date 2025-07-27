/// Token service interface for secure token management
abstract class TokenService {
  /// Save authentication token securely
  Future<void> saveToken(String token);

  /// Get stored authentication token
  Future<String?> getToken();

  /// Check if user has valid token
  Future<bool> hasToken();

  /// Clear stored token (logout)
  Future<void> clearToken();
}
