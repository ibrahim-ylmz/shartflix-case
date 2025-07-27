import 'package:shartflix_case/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:shartflix_case/feature/home/domain/entities/movie.dart';
import 'package:shartflix_case/feature/home/domain/repositories/home_repository.dart';

/// Home Repository Implementation
class HomeRepositoryImpl implements HomeRepository {
  /// Constructor
  HomeRepositoryImpl(this._remoteDataSource);

  final HomeRemoteDatasource _remoteDataSource;

  @override
  Future<List<MovieEntity>> getMovieList({int page = 1}) async {
    final movieModels = await _remoteDataSource.getMovieList(page);
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getFavoriteMovies() async {
    final movieModels = await _remoteDataSource.getFavoriteMovies();
    return movieModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> toggleMovieFavorite(String movieId) async {
    await _remoteDataSource.toggleMovieFavorite(movieId);
  }
}
