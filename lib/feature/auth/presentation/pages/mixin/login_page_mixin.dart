import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_event.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/login_page.dart';

/// Mixin for login page
mixin LoginPageMixin on State<LoginPage> {
  /// Form key for login form
  final formKey = GlobalKey<FormState>();

  /// Email controller for login form
  final emailController = TextEditingController();

  /// Password controller for login form
  final passwordController = TextEditingController();

  /// Navigate to register page
  void navigateToRegister() {
    context.push('/register');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// Handle login button press
  void onLoginPressed() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        LoginRequested(
          email: emailController.text.trim(),
          password: passwordController.text,
        ),
      );
    }
  }
}
