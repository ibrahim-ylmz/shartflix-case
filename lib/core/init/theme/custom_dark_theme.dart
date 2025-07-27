import 'package:flutter/material.dart';
import 'package:shartflix_case/core/init/theme/custom_color_scheme.dart';
import 'package:shartflix_case/core/init/theme/custom_theme.dart';

/// Custom dark theme
final class CustomDarkTheme implements IAppTheme {
  @override
  ThemeData get themeData {
    final colorScheme = CustomColorScheme.darkScheme();
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: CustomTextTheme.getTextTheme(colorScheme),
      scaffoldBackgroundColor: const Color(0xff090909),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffE50914),
          foregroundColor: const Color(0xffffffff),
          textStyle: const TextStyle(
            fontFamily: 'Euclid Circular A',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.1),
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        hintStyle: TextStyle(color: colorScheme.onSurface),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();
}
