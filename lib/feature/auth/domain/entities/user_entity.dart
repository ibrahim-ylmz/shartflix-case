import 'package:equatable/equatable.dart';

/// User entity for domain layer
final class UserEntity extends Equatable {
  /// Constructor
  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  /// User unique identifier
  final String id;

  /// User name
  final String name;

  /// User email address
  final String email;

  /// User profile photo URL
  final String photoUrl;

  /// User authentication token
  final String token;

  @override
  List<Object?> get props => [id, name, email, photoUrl, token];
}
