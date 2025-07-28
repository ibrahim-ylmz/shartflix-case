import 'package:shartflix_case/feature/profile/domain/entities/user_profile_entity.dart';
import 'package:shartflix_case/feature/profile/domain/repositories/profile_repository.dart';

/// Use case for getting user profile.
class GetProfileUseCase {
  /// Constructor
  GetProfileUseCase({required this.repository});

  /// Repository for profile operations.
  final ProfileRepository repository;

  /// UserProfileEntity
  Future<UserProfileEntity> call() {
    return repository.getProfile();
  }
}
