import 'package:flutter/material.dart';
import 'package:shartflix_case/core/init/theme/custom_color_scheme.dart';
import 'package:shartflix_case/core/init/theme/custom_theme.dart';

/// Custom dark theme
final class CustomDarkTheme implements IAppTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkScheme(),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
