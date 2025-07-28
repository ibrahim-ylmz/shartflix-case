import 'package:shartflix_case/feature/home/domain/entities/movie.dart';
import 'package:shartflix_case/feature/profile/domain/repositories/profile_repository.dart';

/// Use case for getting user's favorite movies.
class GetFavoriteMoviesUseCase {
  /// Constructor for [GetFavoriteMoviesUseCase].
  const GetFavoriteMoviesUseCase(this.repository);

  /// Profile repository.
  final ProfileRepository repository;

  /// Gets the user's favorite movies.
  Future<List<MovieEntity>> call() {
    return repository.getFavoriteMovies();
  }
}
