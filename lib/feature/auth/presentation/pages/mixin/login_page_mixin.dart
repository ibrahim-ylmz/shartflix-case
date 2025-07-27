import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/init/language/locale_keys.g.dart';
import 'package:shartflix_case/core/utils/validation_extensions.dart';
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

  /// Validate email field
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validate_email_empty.tr();
    }
    final result = value.validateEmail();
    return result.isValid ? null : result.errorMessage;
  }

  /// Validate password field
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validate_password_empty.tr();
    }
    final result = value.validatePassword();
    return result.isValid ? null : result.errorMessage;
  }

  /// Handle login button press
  void onLoginPressed() {
    // Sadece form validation kullan
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
