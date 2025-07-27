import 'package:equatable/equatable.dart';

/// Auth events for BLoC pattern
abstract class AuthEvent extends Equatable {
  /// Constructor
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Login event
class LoginRequested extends AuthEvent {
  /// Constructor
  const LoginRequested({
    required this.email,
    required this.password,
  });

  /// Login email
  final String email;

  /// Login password
  final String password;

  @override
  List<Object?> get props => [email, password];
}

/// Register event
class RegisterRequested extends AuthEvent {
  /// Constructor
  const RegisterRequested({
    required this.email,
    required this.name,
    required this.password,
  });

  /// Register email
  final String email;

  /// Register name
  final String name;

  /// Register password
  final String password;

  @override
  List<Object?> get props => [email, name, password];
}

/// Logout event
class LogoutRequested extends AuthEvent {
  /// Constructor
  const LogoutRequested();
}
