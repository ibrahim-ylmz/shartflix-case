import 'package:flutter/material.dart';
import 'package:shartflix_case/core/init/theme/custom_color_scheme.dart';
import 'package:shartflix_case/core/init/theme/custom_theme.dart';

/// Custom Light Theme
final class CustomLightTheme implements IAppTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightScheme(),
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
