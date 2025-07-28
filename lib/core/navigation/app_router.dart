import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/navigation/main_shell_page.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/login_page.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/register_page.dart';
import 'package:shartflix_case/feature/home/presentation/pages/home_page.dart';
import 'package:shartflix_case/feature/profile/presentation/pages/photo_upload_page.dart';
import 'package:shartflix_case/feature/profile/presentation/pages/profile_page.dart';
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
    /// Splash Route
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) => _slideTransitionPage(
        const SplashPage(),
        state,
      ),
    ),

    /// Auth Routes
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => _slideTransitionPage(
        const LoginPage(),
        state,
      ),
    ),

    /// Register Route
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => _slideTransitionPage(
        const RegisterPage(),
        state,
      ),
    ),

    /// Photo Upload Route
    GoRoute(
      path: '/photo-upload',
      pageBuilder: (context, state) => _slideTransitionPage(
        const PhotoUploadPage(),
        state,
      ),
    ),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShellPage(navigationShell: navigationShell);
      },
      branches: [
        /// Home tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        /// Profile tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
