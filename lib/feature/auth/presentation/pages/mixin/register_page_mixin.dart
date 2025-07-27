import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/init/language/locale_keys.g.dart';
import 'package:shartflix_case/core/utils/validation_extensions.dart';
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

  /// Name focus node
  final nameFocusNode = FocusNode();

  /// Email focus node
  final emailFocusNode = FocusNode();

  /// Password focus node
  final passwordFocusNode = FocusNode();

  /// Confirm password focus node
  final confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  /// Validate name field
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validate_name_empty.tr();
    }
    final result = value.validateName();
    return result.isValid ? null : result.errorMessage;
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

  /// Validate password confirmation field
  String? validatePasswordConfirmation(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validate_confirm_password_empty.tr();
    }
    final result = value.validatePasswordConfirmation(passwordController.text);
    return result.isValid ? null : result.errorMessage;
  }

  /// On register pressed
  void onRegisterPressed() {
    // Sadece form validation kullan
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
