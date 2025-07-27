import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/init/di/injection_container.dart';
import 'package:shartflix_case/core/services/token_service.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/login_page.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/register_page.dart';
import 'package:shartflix_case/feature/splash/splash_page.dart';

/// Custom slide transition from right to left
Page<T> _slideTransitionPage<T extends Object?>(
  Widget child,
  GoRouterState state,
) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

/// AppRouter is a class that manages the application's routing.
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: <RouteBase>[
    // Splash Route
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) => _slideTransitionPage(
        const SplashPage(),
        state,
      ),
    ),
    // Auth Routes
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => _slideTransitionPage(
        const LoginPage(),
        state,
      ),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => _slideTransitionPage(
        const RegisterPage(),
        state,
      ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => _slideTransitionPage(
        Scaffold(
          body: Column(
            children: [
              ///token clear button
              ElevatedButton(
                onPressed: () {
                  sl<TokenService>().clearToken();
                  appRouter.go('/splash');
                },
                child: const Text('Clear Token'),
              ),
            ],
          ),
        ),
        state,
      ),
    ),
  ],
);
