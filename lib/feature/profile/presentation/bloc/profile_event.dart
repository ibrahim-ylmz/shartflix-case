import 'dart:io';
import 'package:equatable/equatable.dart';

/// Base class for profile events.
abstract class ProfileEvent extends Equatable {
  /// Constructor for [ProfileEvent].
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

/// Event to load profile data.
class LoadProfile extends ProfileEvent {
  /// Constructor for [LoadProfile].
  const LoadProfile();
}

/// Event to load favorite movies.
class LoadFavoriteMovies extends ProfileEvent {
  /// Constructor for [LoadFavoriteMovies].
  const LoadFavoriteMovies();
}

/// Event to upload photo.
class UploadPhoto extends ProfileEvent {
  /// Constructor for [UploadPhoto].
  const UploadPhoto(this.file);

  /// File to upload.
  final File file;

  @override
  List<Object?> get props => [file];
}
