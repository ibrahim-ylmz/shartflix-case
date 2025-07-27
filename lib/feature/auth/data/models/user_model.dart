import 'package:shartflix_case/feature/auth/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final String token;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.token,
  });

  factory UserModel.fromJson(Object? json) {
    if (json is! Map<String, dynamic>) {
      throw ArgumentError('Invalid JSON format for UserModel');
    }
    return UserModel(
      id: (json['id'] as String?) ?? (json['_id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      photoUrl: (json['photoUrl'] as String?) ?? '',
      token: (json['token'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'token': token,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      photoUrl: photoUrl,
      token: token,
    );
  }
}
