import 'package:equatable/equatable.dart';
import 'package:shartflix_case/feature/home/domain/entities/movie.dart';
import 'package:shartflix_case/feature/profile/domain/entities/user_profile_entity.dart';

/// Base class for profile states.
abstract class ProfileState extends Equatable {
  /// Constructor for [ProfileState].
  const ProfileState();

  @override
  List<Object?> get props => [];
}

/// Initial profile state.
class ProfileInitial extends ProfileState {
  /// Constructor for [ProfileInitial].
  const ProfileInitial();
}

/// Profile loading state.
class ProfileLoading extends ProfileState {
  /// Constructor for [ProfileLoading].
  const ProfileLoading();
}

/// Profile loaded state.
class ProfileLoaded extends ProfileState {
  /// Constructor for [ProfileLoaded].
  const ProfileLoaded({
    required this.profile,
    required this.favoriteMovies,
    this.isLoadingFavorites = false,
    this.isUploadingPhoto = false,
  });

  /// User profile entity.
  final UserProfileEntity profile;

  /// List of favorite movies.
  final List<MovieEntity> favoriteMovies;

  /// Whether the favorite movies are loading.
  final bool isLoadingFavorites;

  /// Whether the photo is uploading.
  final bool isUploadingPhoto;

  /// Copy with method for [ProfileLoaded].
  ProfileLoaded copyWith({
    UserProfileEntity? profile,
    List<MovieEntity>? favoriteMovies,
    bool? isLoadingFavorites,
    bool? isUploadingPhoto,
  }) {
    return ProfileLoaded(
      profile: profile ?? this.profile,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
      isLoadingFavorites: isLoadingFavorites ?? this.isLoadingFavorites,
      isUploadingPhoto: isUploadingPhoto ?? this.isUploadingPhoto,
    );
  }

  @override
  List<Object?> get props => [
    profile,
    favoriteMovies,
    isLoadingFavorites,
    isUploadingPhoto,
  ];
}

/// Profile error state.
class ProfileError extends ProfileState {
  /// Constructor for [ProfileError].
  const ProfileError(this.message);

  /// Error message.
  final String message;

  @override
  List<Object?> get props => [message];
}
