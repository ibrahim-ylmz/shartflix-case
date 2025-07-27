import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/init/di/injection_container.dart';
import 'package:shartflix_case/feature/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:shartflix_case/feature/splash/splash_page.dart';

/// Splash page mixin that handles initial navigation
mixin SplashPageMixin on State<SplashPage> {
  /// Animation controller for splash page
  late AnimationController animationController;

  /// Scale animation for splash page
  late Animation<double> scaleAnimation;

  /// Opacity animation for splash page
  late Animation<double> opacityAnimation;

  Future<void> _startSplashSequence() async {
    // Show splash for minimum 2 seconds
    await Future<void>.delayed(const Duration(seconds: 2));

    // Check authentication status
    final checkAuthStatusUseCase = sl<CheckAuthStatusUseCase>();
    final isAuthenticated = await checkAuthStatusUseCase();

    // Start zoom animation
    await animationController.forward();

    // Navigate based on auth status
    if (mounted) {
      if (isAuthenticated) {
        context.go('/home');
      } else {
        context.go('/login');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startSplashSequence();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this as TickerProvider,
    );

    scaleAnimation =
        Tween<double>(
          begin: 1,
          end: 1.2,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOut,
          ),
        );

    opacityAnimation =
        Tween<double>(
          begin: 1,
          end: 0,
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.5, 1, curve: Curves.easeInOut),
          ),
        );
  }
}
