import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/feature/home/presentation/widgets/app_bottom_nav_bar.dart';

/// MainShellPage is a widget that displays a bottom navigation bar.
class MainShellPage extends StatelessWidget {
  /// Navigation shell.
  const MainShellPage({
    required this.navigationShell,
    super.key,
  });

  /// Navigation shell.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}
