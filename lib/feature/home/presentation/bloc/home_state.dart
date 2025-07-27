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
  });

  /// Featured Movies
  final List<MovieEntity> featuredMovies;

  @override
  List<Object?> get props => [
    featuredMovies,
  ];

  /// Copy with
  HomeLoaded copyWith({
    List<MovieEntity>? featuredMovies,
  }) {
    return HomeLoaded(
      featuredMovies: featuredMovies ?? this.featuredMovies,
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
