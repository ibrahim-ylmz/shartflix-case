import 'package:flutter/material.dart';

/// Base class for defining themes
abstract class IAppTheme {
  /// Main theme data for the app
  ThemeData get themeData;

  ///
  FloatingActionButtonThemeData get floatingActionButtonThemeData;
}

/// Custom text theme extensions
class CustomTextTheme {
  /// Get text theme based on color scheme
  static TextTheme getTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Title text style
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),
      // Subtitle text style
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),

      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1,
        letterSpacing: 0,
        color: colorScheme.onSurface,
      ),
    );
  }
}
