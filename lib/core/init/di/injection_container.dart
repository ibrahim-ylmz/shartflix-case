import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shartflix_case/core/network/manager/i_network_manager.dart';
import 'package:shartflix_case/core/network/manager/network_manager.dart';
import 'package:shartflix_case/core/services/secure_token_service.dart';
import 'package:shartflix_case/core/services/token_service.dart';

// Auth imports
import 'package:shartflix_case/feature/auth/data/datasources/auth_remote_datasource.dart';
import 'package:shartflix_case/feature/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:shartflix_case/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:shartflix_case/feature/auth/domain/repositories/auth_repository.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/login_user_usecase.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/logout_user_usecase.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/register_user_usecase.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_bloc.dart';

// Home imports
import 'package:shartflix_case/feature/home/data/datasources/home_remote_datasource.dart';
import 'package:shartflix_case/feature/home/data/datasources/home_remote_datasource_impl.dart';
import 'package:shartflix_case/feature/home/data/repositories/home_repository_impl.dart';
import 'package:shartflix_case/feature/home/domain/repositories/home_repository.dart';
import 'package:shartflix_case/feature/home/domain/usecases/get_featured_movies.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_bloc.dart';

/// This is the dependency injection container instance
final GetIt sl = GetIt.instance;

/// This method is used to initialize the dependency injection container
Future<void> init() async {
  // Core dependencies
  sl
    ..registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    )
    ..registerLazySingleton<TokenService>(
      () => SecureTokenService(sl<FlutterSecureStorage>()),
    )
    ..registerSingleton<INetworkManager>(
      NetworkManager(sl<FlutterSecureStorage>()),
    );

  // Auth dependencies
  _initAuth();

  // Home dependencies
  _initHome();
}

/// Initialize auth dependencies
void _initAuth() {
  // Data sources
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl<INetworkManager>()),
    )
    // Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl<AuthRemoteDataSource>(), sl<TokenService>()),
    )
    // Use cases
    ..registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(sl<AuthRepository>()),
    )
    ..registerLazySingleton<RegisterUserUseCase>(
      () => RegisterUserUseCase(sl<AuthRepository>()),
    )
    ..registerLazySingleton<CheckAuthStatusUseCase>(
      () => CheckAuthStatusUseCase(sl<TokenService>()),
    )
    ..registerLazySingleton<LogoutUserUseCase>(
      () => LogoutUserUseCase(sl<TokenService>()),
    )
    // BLoC
    ..registerFactory<AuthBloc>(
      () => AuthBloc(
        loginUserUseCase: sl<LoginUserUseCase>(),
        registerUserUseCase: sl<RegisterUserUseCase>(),
        logoutUserUseCase: sl<LogoutUserUseCase>(),
      ),
    );
}

/// Initialize home dependencies
void _initHome() {
  // Data sources
  sl
    ..registerLazySingleton<HomeRemoteDatasource>(
      () => HomeRemoteDatasourceImpl(sl()),
    )
    // Repository
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl()),
    )
    // Use cases
    ..registerLazySingleton<GetMovieListUseCase>(
      () => GetMovieListUseCase(sl()),
    )
    // BLoC
    ..registerFactory<HomeBloc>(
      () => HomeBloc(
        getMovieListUseCase: sl<GetMovieListUseCase>(),
      ),
    );
}
