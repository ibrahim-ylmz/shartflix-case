import 'package:shartflix_case/feature/home/domain/entities/movie.dart';

/// Home Repository interface for domain layer
abstract class HomeRepository {
  /// Get movie list
  Future<List<MovieEntity>> getMovieList({int page = 1});

  /// Get favorite movies
  Future<List<MovieEntity>> getFavoriteMovies();

  /// Toggle movie favorite
  Future<void> toggleMovieFavorite(String movieId);
}
