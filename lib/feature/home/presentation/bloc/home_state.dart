import 'package:equatable/equatable.dart';
import 'package:shartflix_case/feature/home/domain/entities/movie.dart';

/// Home State for handling home screen state
abstract class HomeState extends Equatable {
  /// Constructor
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Home Initial State
class HomeInitial extends HomeState {}

/// Home Loading State
class HomeLoading extends HomeState {}

/// Home Loaded State
class HomeLoaded extends HomeState {
  /// Constructor
  const HomeLoaded({
    required this.featuredMovies,
    this.currentPage = 1,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  /// Featured Movies
  final List<MovieEntity> featuredMovies;

  /// Current page number
  final int currentPage;

  /// Whether there are more movies to load
  final bool hasMore;

  /// Whether currently loading more movies
  final bool isLoadingMore;

  @override
  List<Object?> get props => [
    featuredMovies,
    currentPage,
    hasMore,
    isLoadingMore,
  ];

  /// Copy with
  HomeLoaded copyWith({
    List<MovieEntity>? featuredMovies,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return HomeLoaded(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

/// Home Error State
class HomeError extends HomeState {
  /// Constructor
  const HomeError(this.message);

  /// Error message
  final String message;

  @override
  List<Object?> get props => [message];
}
