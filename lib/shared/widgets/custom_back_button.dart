import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// CustomBackButton is a widget that displays a back button.
class CustomBackButton extends StatelessWidget {
  /// const constructor
  const CustomBackButton({
    super.key,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
    this.size,
  });

  /// onPressed is the callback function
  final VoidCallback? onPressed;

  /// iconColor is the color of the icon.
  final Color? iconColor;

  /// backgroundColor is the color of the background.
  final Color? backgroundColor;

  /// size is the size of the icon.
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF1A1A1A),
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF333333),
        ),
      ),
      child: IconButton(
        onPressed: onPressed ?? () => context.pop(),
        icon: Icon(
          Icons.arrow_back,
          color: iconColor ?? Colors.white,
          size: size ?? 20,
        ),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
        ),
      ),
    );
  }
}
