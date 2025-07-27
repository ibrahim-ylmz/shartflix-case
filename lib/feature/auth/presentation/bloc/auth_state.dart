import 'package:equatable/equatable.dart';
import 'package:shartflix_case/feature/auth/domain/entities/user_entity.dart';

/// Auth state for BLoC pattern
abstract class AuthState extends Equatable {
  /// Constructor
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {
  /// Constructor
  const AuthInitial();
}

/// Loading state
class AuthLoading extends AuthState {
  /// Constructor
  const AuthLoading();
}

/// Success state with user data
class AuthSuccess extends AuthState {
  /// Constructor
  const AuthSuccess(this.user);

  /// User data
  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

/// Error state with error message
class AuthError extends AuthState {
  /// Constructor
  const AuthError(this.message);

  /// Error message
  final String message;

  @override
  List<Object?> get props => [message];
}
