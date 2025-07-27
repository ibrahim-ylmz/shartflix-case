import 'package:shartflix_case/feature/home/domain/entities/movie.dart';
import 'package:shartflix_case/feature/home/domain/repositories/home_repository.dart';

/// Use case for getting movie list
class GetMovieListUseCase {
  /// Constructor
  GetMovieListUseCase(this._repository);
  final HomeRepository _repository;

  /// Execute use case
  Future<List<MovieEntity>> call({int page = 1}) {
    return _repository.getMovieList(page: page);
  }
}
