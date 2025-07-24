import 'package:flutter/material.dart';

/// This class is used to store the application constants
abstract class AppConstants {
  /// This method is used to get the primary color
  static const Color primaryColor = Color(0xFF1A5CFF);

  /// This method is used to get the background color
  static const Color backgroundColor = Color(0xFFF2F5F9);

  /// This method is used to get the text white color
  static const Color textWhite = Colors.white;

  /// This method is used to get the text dark color
  static const Color textDark = Color(0xFF333333);

  /// This method is used to get the text grey color
  static const Color textGrey = Color(0xFF666666);

  /// This method is used to get the card radius
  static const double cardRadius = 12;

  /// This method is used to get the card elevation
  static const double cardElevation = 2;

  /// Diğer
  static const Duration animationDuration = Duration(milliseconds: 300);
}
