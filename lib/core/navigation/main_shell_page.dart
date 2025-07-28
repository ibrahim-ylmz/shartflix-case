import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/feature/home/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_event.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_state.dart';

/// MainShellPage is the shell for the main pages of the app.
class MainShellPage extends StatefulWidget {
  /// Creates an instance of [MainShellPage].
  const MainShellPage({required this.navigationShell, super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _previousIndex = 0;

  void _onTap(int index) {
    if (index == 1 && _previousIndex == 0) {
      final profileBloc = context.read<ProfileBloc>();
      final currentState = profileBloc.state;
      if (currentState is ProfileLoaded) {
        profileBloc.add(const LoadFavoriteMovies());
      }
    }

    _previousIndex = index;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
