import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// AppBottomNavBar is a widget that displays a bottom navigation bar.
class AppBottomNavBar extends StatelessWidget {
  /// Creates an instance of [AppBottomNavBar].
  const AppBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  /// Current index of the bottom navigation bar.
  final int currentIndex;

  /// Callback function to be called when a navigation item is tapped.
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF090909).withValues(alpha: 0.5),
        border: Border(
          top: BorderSide(
            color: Colors.black.withValues(alpha: 0.2),
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            _buildNavItem(
              context: context,
              index: 0,
              icon: 'assets/icons/ic_home.svg',
              activeIcon: 'assets/icons/ic_home.svg',
              label: 'Anasayfa',
            ),
            _buildNavItem(
              context: context,
              index: 1,
              icon: 'assets/icons/ic_profil.svg',
              activeIcon: 'assets/icons/ic_profil.svg',
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    final isActive = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                isActive ? activeIcon : icon,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                width: 28,
                height: 28,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
