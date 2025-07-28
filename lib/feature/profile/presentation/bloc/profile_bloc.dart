import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/feature/profile/domain/usecases/get_favorite_movies_usecase.dart';
import 'package:shartflix_case/feature/profile/domain/usecases/get_profile_usecase.dart';
import 'package:shartflix_case/feature/profile/domain/usecases/upload_photo_usecase.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_event.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_state.dart';

/// Bloc for managing profile state.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  /// Constructor for [ProfileBloc].
  ProfileBloc({
    required this.getProfileUseCase,
    required this.getFavoriteMoviesUseCase,
    required this.uploadPhotoUseCase,
  }) : super(const ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
    on<LoadFavoriteMovies>(_onLoadFavoriteMovies);
    on<UploadPhoto>(_onUploadPhoto);
  }

  /// Use case for getting profile.
  final GetProfileUseCase getProfileUseCase;

  /// Use case for getting favorite movies.
  final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

  /// Use case for uploading photo.
  final UploadPhotoUseCase uploadPhotoUseCase;

  /// Handles loading profile event.
  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    try {
      final profile = await getProfileUseCase();
      final favoriteMovies = await getFavoriteMoviesUseCase();
      emit(
        ProfileLoaded(
          profile: profile,
          favoriteMovies: favoriteMovies,
        ),
      );
    } on Exception catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  /// Handles loading favorite movies event.
  Future<void> _onLoadFavoriteMovies(
    LoadFavoriteMovies event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      emit(currentState.copyWith(isLoadingFavorites: true));

      try {
        final favoriteMovies = await getFavoriteMoviesUseCase();
        emit(
          currentState.copyWith(
            favoriteMovies: favoriteMovies,
            isLoadingFavorites: false,
          ),
        );
      } on Exception catch (_) {
        emit(currentState.copyWith(isLoadingFavorites: false));
      }
    }
  }

  /// Handles upload photo event.
  Future<void> _onUploadPhoto(
    UploadPhoto event,
    Emitter<ProfileState> emit,
  ) async {
    if (state is ProfileLoaded) {
      final currentState = state as ProfileLoaded;
      emit(currentState.copyWith(isUploadingPhoto: true));

      try {
        final updatedProfile = await uploadPhotoUseCase(event.file);
        emit(
          currentState.copyWith(
            profile: updatedProfile,
            isUploadingPhoto: false,
          ),
        );
      } on Exception catch (_) {
        emit(currentState.copyWith(isUploadingPhoto: false));
      }
    }
  }
}
