import 'dart:io';

import 'package:shartflix_case/feature/home/domain/entities/movie.dart';
import 'package:shartflix_case/feature/profile/domain/entities/user_profile_entity.dart';

/// Profile repository interface
abstract class ProfileRepository {
  /// Gets the user profile.
  Future<UserProfileEntity> getProfile();

  /// Uploads a photo for the user.
  Future<UserProfileEntity> uploadPhoto(File file);

  /// Gets the user's favorite movies.
  Future<List<MovieEntity>> getFavoriteMovies();
}
