/// This is the configuration for the network.  
final class NetworkConfig {
  /// Base URL for the network.
  static const String baseUrl = 'https://caseapi.servicelabs.tech';
  /// Connect timeout for the network.
  static const Duration connectTimeout = Duration(seconds: 15);
  /// Receive timeout for the network.
  static const Duration receiveTimeout = Duration(seconds: 15);
} 
