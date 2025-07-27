import 'package:flutter/material.dart';

/// Custom button widget for auth forms
class AuthButton extends StatelessWidget {
  /// Constructor
  const AuthButton({
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.height = 57,
    this.borderRadius = 18,
    super.key,
  });

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Button text
  final String text;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Background color of the button
  final Color? backgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Button height
  final double height;

  /// Button border radius
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
          disabledBackgroundColor: Theme.of(context)
              .colorScheme
              .primary
              .withValues(alpha: 0.1),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
      ),
    );
  }
}
