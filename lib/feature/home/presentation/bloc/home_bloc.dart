import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/feature/home/domain/usecases/get_featured_movies.dart';
import 'package:shartflix_case/feature/home/domain/usecases/toggle_movie_like.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_event.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_state.dart';

/// Home BLoC for handling home screen logic
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Constructor
  HomeBloc({
    required GetMovieListUseCase getMovieListUseCase,
    required ToggleMovieFavoriteUseCase toggleMovieFavoriteUseCase,
  }) : _getMovieListUseCase = getMovieListUseCase,
       _toggleMovieFavoriteUseCase = toggleMovieFavoriteUseCase,
       super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<ToggleMovieLike>(_onToggleMovieLike);
    on<RefreshHomeData>(_onRefreshHomeData);
  }
  final GetMovieListUseCase _getMovieListUseCase;
  final ToggleMovieFavoriteUseCase _toggleMovieFavoriteUseCase;

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final results = await _getMovieListUseCase.call();
      emit(
        HomeLoaded(
          featuredMovies: results,
        ),
      );
    } on Exception catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onLoadMoreMovies(
    LoadMoreMovies event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HomeLoaded ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    emit(currentState.copyWith(isLoadingMore: true));

    try {
      final nextPage = currentState.currentPage + 1;
      final newMovies = await _getMovieListUseCase.call(page: nextPage);

      final allMovies = [...currentState.featuredMovies, ...newMovies];

      emit(
        currentState.copyWith(
          featuredMovies: allMovies,
          currentPage: nextPage,
          hasMore: newMovies.length >= 5,
          isLoadingMore: false,
        ),
      );
    } on Exception catch (e) {
      emit(currentState.copyWith(isLoadingMore: false));
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onToggleMovieLike(
    ToggleMovieLike event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HomeLoaded) return;

    final updatedMovies = currentState.featuredMovies.map((movie) {
      if (movie.id == event.movieId) {
        return movie.copyWith(isFavorite: !(movie.isFavorite ?? false));
      }
      return movie;
    }).toList();

    emit(currentState.copyWith(featuredMovies: updatedMovies));

    try {
      await _toggleMovieFavoriteUseCase.call(event.movieId);
    } on Exception {
      emit(currentState.copyWith(featuredMovies: currentState.featuredMovies));
    }
  }

  Future<void> _onRefreshHomeData(
    RefreshHomeData event,
    Emitter<HomeState> emit,
  ) async {
    add(LoadHomeData());
  }
}
