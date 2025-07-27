import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/feature/home/presentation/widgets/app_bottom_nav_bar.dart';

/// MainShellPage is the shell for the main pages of the app.
class MainShellPage extends StatelessWidget {
  /// Creates an instance of [MainShellPage].
  const MainShellPage({required this.navigationShell, super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
