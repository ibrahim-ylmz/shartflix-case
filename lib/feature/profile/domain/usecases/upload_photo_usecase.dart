import 'dart:io';
import 'package:shartflix_case/feature/profile/domain/entities/user_profile_entity.dart';
import 'package:shartflix_case/feature/profile/domain/repositories/profile_repository.dart';

/// Use case for uploading user photo.
class UploadPhotoUseCase {
  /// Constructor
  UploadPhotoUseCase({required this.repository});

  /// Repository for profile operations.
  final ProfileRepository repository;

  /// UserProfileEntity
  Future<UserProfileEntity> call(File file) {
    return repository.uploadPhoto(file);
  }
}
