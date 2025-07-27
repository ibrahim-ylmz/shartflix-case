import 'package:dio/dio.dart';
import 'package:shartflix_case/core/network/exceptions/network_exceptions.dart';
import 'package:shartflix_case/core/network/manager/i_network_manager.dart';
import 'package:shartflix_case/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:shartflix_case/feature/home/data/models/movie_model.dart';

/// Home Remote Data Source Implementation
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  /// Constructor
  HomeRemoteDatasourceImpl(this._networkManager);
  final INetworkManager _networkManager;

  @override
  Future<List<MovieModel>> getMovieList(int page) async {
    try {
      return await _networkManager.get<List<MovieModel>>(
        '/movie/list?page=$page',
        fromJsonT: (json) {
          final data = json! as Map<String, dynamic>;
          final movies = data['movies'] as List;
          return movies.map(MovieModel.fromJson).toList();
        },
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies() async {
    try {
      return await _networkManager.get<List<MovieModel>>(
        '/movie/favorites',
        fromJsonT: (json) {
          final data = json! as Map<String, dynamic>;
          final movies = data['movies'] as List;
          return movies.map(MovieModel.fromJson).toList();
        },
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> toggleMovieFavorite(String movieId) async {
    try {
      await _networkManager.post<void>(
        '/movie/favorites/$movieId',
        fromJsonT: (json) => json,
      );
    } on DioException catch (e) {
      throw ServerException.fromDio(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
