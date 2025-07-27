import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_event.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/register_page.dart';

/// Register page mixin
mixin RegisterPageMixin on State<RegisterPage> {
  /// Form key
  final formKey = GlobalKey<FormState>();

  /// Name controller
  final nameController = TextEditingController();

  /// Email controller
  final emailController = TextEditingController();

  /// Password controller
  final passwordController = TextEditingController();

  /// Confirm password controller
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /// On register pressed
  void onRegisterPressed() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        RegisterRequested(
          email: emailController.text.trim(),
          name: nameController.text.trim(),
          password: passwordController.text,
        ),
      );
    }
  }

  /// Navigate to login
  void navigateToLogin() {
    context.pop();
  }
}
