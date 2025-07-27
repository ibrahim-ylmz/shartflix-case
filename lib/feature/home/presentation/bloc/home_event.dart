import 'package:equatable/equatable.dart';

/// Home Event for handling home screen events
abstract class HomeEvent extends Equatable {
  /// Constructor
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Load Home Data Event
class LoadHomeData extends HomeEvent {}

/// Toggle Movie Like Event
class ToggleMovieLike extends HomeEvent {
  /// Constructor
  const ToggleMovieLike(this.movieId);

  /// Movie ID
  final String movieId;

  @override
  List<Object?> get props => [movieId];
}

/// Load More Movies Event
class LoadMoreMovies extends HomeEvent {}

/// Refresh Home Data Event
class RefreshHomeData extends HomeEvent {}
