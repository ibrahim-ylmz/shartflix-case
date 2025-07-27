import 'package:shartflix_case/feature/home/data/models/movie_model.dart';

/// Home Remote Data Source
abstract class HomeRemoteDatasource {
  /// Get Movie List
  Future<List<MovieModel>> getMovieList(int page);

  /// Get Favorite Movies
  Future<List<MovieModel>> getFavoriteMovies();

  /// Toggle Movie Favorite
  Future<void> toggleMovieFavorite(String movieId);
}
