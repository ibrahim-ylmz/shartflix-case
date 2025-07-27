import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/core/network/exceptions/network_exceptions.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/login_user_usecase.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/logout_user_usecase.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/register_user_usecase.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_event.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_state.dart';

/// Auth BLoC for handling authentication logic
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Constructor
  AuthBloc({
    required LoginUserUseCase loginUserUseCase,
    required RegisterUserUseCase registerUserUseCase,
    required LogoutUserUseCase logoutUserUseCase,
  })  : _loginUserUseCase = loginUserUseCase,
        _registerUserUseCase = registerUserUseCase,
        _logoutUserUseCase = logoutUserUseCase,
        super(const AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final LoginUserUseCase _loginUserUseCase;
  final RegisterUserUseCase _registerUserUseCase;
  final LogoutUserUseCase _logoutUserUseCase;

  /// Handle login request
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _loginUserUseCase(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess(user));
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Handle register request
  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final user = await _registerUserUseCase(
        email: event.email,
        name: event.name,
        password: event.password,
      );
      emit(AuthSuccess(user));
    } on ServerException catch (e) {
      emit(AuthError(e.message));
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  /// Handle logout request
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _logoutUserUseCase();
      emit(const AuthInitial());
    } on Exception catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
