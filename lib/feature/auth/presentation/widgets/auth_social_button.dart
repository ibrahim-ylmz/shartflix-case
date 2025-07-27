import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Social button widget for auth forms
final class SocialButton extends StatelessWidget {
  /// Constructor
  const SocialButton({
    /// Icon path for the social button
    required this.iconSvgPath,

    /// Callback when the button is pressed
    required this.onPressed,
    super.key,
  });

  /// Icon path for the social button
  final String iconSvgPath;

  /// Callback when the button is pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 63,
      height: 63,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colorScheme.onSurface.withValues(alpha: 0.2),
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          width: 24,
          height: 24,
          iconSvgPath,
          colorFilter: ColorFilter.mode(
            colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
