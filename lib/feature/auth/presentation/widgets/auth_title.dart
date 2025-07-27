import 'package:flutter/material.dart';
import 'package:shartflix_case/core/init/theme/custom_theme.dart';

/// Auth title widget
final class AuthTitle extends StatelessWidget {
  /// Constructor
  const AuthTitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  /// Title of the auth page
  final String title;

  /// Subtitle of the auth page
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          title,
          style: CustomTextTheme.getTextTheme(colorScheme).titleLarge,
        ),
        const SizedBox(height: 12),

        //max widht
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: CustomTextTheme.getTextTheme(
              colorScheme,
            ).bodySmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            strutStyle: const StrutStyle(height: 1.2),
          ),
        ),
      ],
    );
  }
}
