import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shartflix_case/core/consts/enums/locales.dart';

@immutable

/// LocalizationManager is a class that manages localization.
final class LocalizationManager extends EasyLocalization {
  /// LocalizationManager need to [child] for a wrap locale item
  LocalizationManager({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _translationPath,
          startLocale: Locales.en.locale,
        );

  /// This is a list of supported languages.
  static final List<Locale> _supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationPath = 'assets/translations';

  /// Change project language by using [Locales]
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
