import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_event.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_state.dart';

/// HomePageMixin
mixin HomePageMixin<T extends StatefulWidget> on State<T> {
  /// Page controller for handling page navigation
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(_scrollListener);
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  void dispose() {
    pageController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!pageController.hasClients) return;

    final currentState = context.read<HomeBloc>().state;
    if (currentState is! HomeLoaded) return;

    final currentPage = pageController.page ?? 0;
    final totalMovies = currentState.featuredMovies.length;

    if (currentPage >= totalMovies - 1.5 &&
        currentState.hasMore &&
        !currentState.isLoadingMore) {
      context.read<HomeBloc>().add(LoadMoreMovies());
    }
  }
}
