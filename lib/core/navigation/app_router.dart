import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/init/di/injection_container.dart';
import 'package:shartflix_case/core/services/token_service.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/login_page.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/register_page.dart';
import 'package:shartflix_case/feature/splash/splash_page.dart';


/// AppRouter is a class that manages the application's routing.
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: <RouteBase>[
    // Splash Route
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    // Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Scaffold(
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
        )
      ),
    ),
  ],
);
