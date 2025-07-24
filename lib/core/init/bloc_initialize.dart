import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This class is used to initialize the Bloc providers
class BlocInitialize extends StatelessWidget {
  /// This class is used to initialize the Bloc providers
  const BlocInitialize({required this.child, super.key});

  /// [child] is the widget that will be wrapped with the Bloc providers
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: child,
    );
  }
}
