import 'package:flutter/material.dart';

/// Project custom colors
final class CustomColorScheme {
  CustomColorScheme._();

  /// Light color scheme set
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xffE50914),
      surfaceTint: Color(0xffE50914),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffFFFFFF),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff5a6473),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffFFFFFF),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color.fromARGB(0, 109, 78, 125),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffFFFFFF),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xffffffff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff73777e),
      outlineVariant: Color(0xffc4c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff000000),
      inversePrimary: Color(0xffE50914),
      primaryFixed: Color(0xffFFFFFF),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffE50914),
      onPrimaryFixedVariant: Color(0xff000000),
      secondaryFixed: Color(0xffFFFFFF),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbcc8d9),
      onSecondaryFixedVariant: Color(0xff000000),
      tertiaryFixed: Color(0xffFFFFFF),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd1aed8),
      onTertiaryFixedVariant: Color(0xff000000),
      surfaceDim: Color(0xfff5f5f5),
      surfaceBright: Color(0xffffffff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f8f8),
      surfaceContainer: Color(0xffFFFFFF),
      surfaceContainerHigh: Color(0xffFFFFFF),
      surfaceContainerHighest: Color(0xffFFFFFF),
    );
  }

  /// Dark color scheme set
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffE50914), // primaryRed / lightRed
      surfaceTint: Color(0xffE50914),
      onPrimary: Color(0xffffffff), // textColor
      primaryContainer: Color(0xff6F060B), // darkRed
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5949E6), // lightBlue
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff1a1a1a), // surfaceColor
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff8C8C8C), // greyColor
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1a1a1a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff090909), // darkSurfaceColor
      onSurface: Color(0xffffffff), // textColor
      onSurfaceVariant: Color(0xff8C8C8C), // greyColor
      outline: Color(0xff8C8C8C), // greyColor
      outlineVariant: Color(0xff44474e),
      shadow: Color(0xff000000), // backgroundColor
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffffffff),
      inversePrimary: Color(0xffE50914),
      primaryFixed: Color(0xff1a1a1a), // surfaceColor
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffE50914),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff1a1a1a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5949E6),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1a1a1a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8C8C8C),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xff000000), // backgroundColor
      surfaceBright: Color(0xff1a1a1a), // surfaceColor
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff090909), // darkSurfaceColor
      surfaceContainer: Color(0xff1a1a1a), // surfaceColor
      surfaceContainerHigh: Color(0xff1a1a1a),
      surfaceContainerHighest: Color(0xff1a1a1a),
    );
  }
}
