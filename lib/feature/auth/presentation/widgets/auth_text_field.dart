import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Custom text field for auth forms
class AuthTextField extends StatefulWidget {
  /// Constructor
  const AuthTextField({
    /// Text editing controller
    required this.controller,

    /// Hint text for the field
    required this.hintText,

    /// Whether this is a password field
    this.isPassword = false,

    /// Keyboard type
    this.keyboardType = TextInputType.text,

    /// Validator function
    this.validator,

    /// Prefix icon
    this.prefixIcon,

    /// Focus node for the field
    this.focusNode,

    /// Text input action for the keyboard
    this.textInputAction,

    /// On field submitted callback
    this.onFieldSubmitted,
    super.key,
  });

  /// Text editing controller
  final TextEditingController controller;

  /// Hint text for the field
  final String hintText;

  /// Whether this is a password field
  final bool isPassword;

  /// Keyboard type
  final TextInputType keyboardType;

  /// Validator function
  final String? Function(String?)? validator;

  /// Prefix icon
  final SvgPicture? prefixIcon;

  /// Focus node for the field
  final FocusNode? focusNode;

  /// Text input action for the keyboard
  final TextInputAction? textInputAction;

  /// On field submitted callback
  final void Function(String)? onFieldSubmitted;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      /// fix this 
      obscureText: widget.isPassword && !_isPasswordVisible,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 24, right: 5),
                child: widget.prefixIcon,
              )
            : null,
        suffixIcon: widget.isPassword
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  onPressed: _togglePasswordVisibility,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.2),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(
          context,
        ).colorScheme.onSurface.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 22,
        ),
      ),
    );
  }
}
