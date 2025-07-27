import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix_case/core/init/language/locale_keys.g.dart';
import 'package:shartflix_case/core/utils/validation_result.dart';

/// String validation extension methods
extension ValidationExtensions on String {
  /// Email validation
  ValidationResult validateEmail() {
    if (isEmpty) {
      return ValidationResult.invalid(LocaleKeys.validate_email_empty.tr());
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(this)) {
      return ValidationResult.invalid(LocaleKeys.validate_email_invalid.tr());
    }

    return const ValidationResult.valid();
  }

  /// Password validation
  ValidationResult validatePassword() {
    if (isEmpty) {
      return ValidationResult.invalid(LocaleKeys.validate_password_empty.tr());
    }

    if (length < 6) {
      return ValidationResult.invalid(
        LocaleKeys.validate_password_invalid.tr(),
      );
    }

    if (length > 50) {
      return ValidationResult.invalid(
        LocaleKeys.validate_password_max_length.tr(),
      );
    }

    return const ValidationResult.valid();
  }

  /// Name validation (for register)
  ValidationResult validateName() {
    if (isEmpty) {
      return ValidationResult.invalid(LocaleKeys.validate_name_empty.tr());
    }

    if (length < 2) {
      return ValidationResult.invalid(LocaleKeys.validate_name_invalid.tr());
    }

    if (length > 50) {
      return ValidationResult.invalid(LocaleKeys.validate_name_max_length.tr());
    }

    // Sadece harf, boşluk ve Türkçe karakterler
    final nameRegex = RegExp(r'^[a-zA-ZçğıöşüÇĞIİÖŞÜ\s]+$');
    if (!nameRegex.hasMatch(this)) {
      return ValidationResult.invalid(
        LocaleKeys.validate_name_invalid_character.tr(),
      );
    }

    return const ValidationResult.valid();
  }

  /// Password confirmation validation
  ValidationResult validatePasswordConfirmation(String originalPassword) {
    if (isEmpty) {
      return ValidationResult.invalid(
        LocaleKeys.validate_confirm_password_empty.tr(),
      );
    }

    if (this != originalPassword) {
      return ValidationResult.invalid(
        LocaleKeys.validate_confirm_password_invalid.tr(),
      );
    }

    return const ValidationResult.valid();
  }

  /// Generic required field validation
  ValidationResult validateRequired([String? fieldName]) {
    if (isEmpty) {
      return ValidationResult.invalid(
        '${fieldName ?? 'Bu alan'} boş olamaz',
      );
    }
    return const ValidationResult.valid();
  }
}
