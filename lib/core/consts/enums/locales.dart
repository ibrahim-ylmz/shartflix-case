import 'package:flutter/material.dart';

/// This is an enum for supported languages
/// and their locale variables
/// if you want to add a new language,
/// you must add it to this enum
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR')),

  /// English locale
  en(Locale('en', 'US'));

  const Locales(this.locale);

  /// This is a locale variable.
  final Locale locale;
}
