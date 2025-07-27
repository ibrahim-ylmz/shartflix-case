import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_event.dart';
import 'package:shartflix_case/feature/home/presentation/pages/home_page.dart';

/// HomePageMixin
mixin HomePageMixin on State<HomePage> {
  /// PageController for vertical PageView
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
