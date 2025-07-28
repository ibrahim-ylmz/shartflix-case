import 'dart:io';
import 'package:shartflix_case/feature/home/domain/entities/movie.dart';
import 'package:shartflix_case/feature/profile/data/datasources/profile_remote_datasource.dart';
import 'package:shartflix_case/feature/profile/domain/entities/user_profile_entity.dart';
import 'package:shartflix_case/feature/profile/domain/repositories/profile_repository.dart';

/// Implementation of [ProfileRepository].
class ProfileRepositoryImpl implements ProfileRepository {
  /// Constructor
  ProfileRepositoryImpl(this.remoteDataSource);

  /// Remote data source for profile operations.
  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<UserProfileEntity> getProfile() async {
    final model = await remoteDataSource.getProfile();
    return model.toEntity();
  }

  @override
  Future<UserProfileEntity> uploadPhoto(File file) async {
    final model = await remoteDataSource.uploadPhoto(file);
    return model.toEntity();
  }

  @override
  Future<List<MovieEntity>> getFavoriteMovies() async {
    final models = await remoteDataSource.getFavoriteMovies();
    return models.map((model) => model.toEntity()).toList();
  }
}
