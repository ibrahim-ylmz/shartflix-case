import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/core/init/di/injection_container.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_bloc.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_bloc.dart';

/// This class is used to initialize the Bloc providers
class BlocInitialize extends StatelessWidget {
  /// This class is used to initialize the Bloc providers
  const BlocInitialize({required this.child, super.key});

  /// [child] is the widget that will be wrapped with the Bloc providers
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => sl<ProfileBloc>(),
        ),
      ],
      child: child,
    );
  }
}
