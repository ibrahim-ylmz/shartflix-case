import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shartflix_case/core/network/exceptions/network_exceptions.dart';
import 'package:shartflix_case/core/network/manager/i_network_manager.dart';
import 'package:shartflix_case/feature/home/data/models/movie_model.dart';
import 'package:shartflix_case/feature/profile/data/models/user_profile_model.dart';

/// Remote data source for profile operations.
abstract class ProfileRemoteDataSource {
  /// Gets the user profile.
  Future<UserProfileModel> getProfile();

  /// Uploads a photo for the user.
  Future<UserProfileModel> uploadPhoto(File file);

  /// Gets the user's favorite movies.
  Future<List<MovieModel>> getFavoriteMovies();
}

/// Implementation of [ProfileRemoteDataSource].
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  /// Constructor for [ProfileRemoteDataSourceImpl].
  ProfileRemoteDataSourceImpl({required this.networkManager});

  /// Network manager for making HTTP requests.
  final INetworkManager networkManager;

  @override
  Future<UserProfileModel> getProfile() async {
    try {
      return await networkManager.get<UserProfileModel>(
        '/user/profile',
        fromJsonT: UserProfileModel.fromJson,
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserProfileModel> uploadPhoto(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });
      final response = await networkManager.post<UserProfileModel>(
        '/user/upload_photo',
        data: formData,
        fromJsonT: UserProfileModel.fromJson,
      );
      return response;
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    try {
      return await networkManager.get<List<MovieModel>>(
        '/movie/favorites',
        fromJsonT: (json) {
          final data = json! as List;
          return data.map(MovieModel.fromJson).toList();
        },
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
