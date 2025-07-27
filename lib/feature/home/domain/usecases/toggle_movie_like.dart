import 'package:shartflix_case/feature/home/domain/repositories/home_repository.dart';

/// Use case for toggling movie favorite
class ToggleMovieFavoriteUseCase {
  /// Constructor
  ToggleMovieFavoriteUseCase(this._repository);

  /// Home repository instance
  final HomeRepository _repository;

  /// Execute use case
  Future<void> call(String movieId) {
    return _repository.toggleMovieFavorite(movieId);
  }
}
