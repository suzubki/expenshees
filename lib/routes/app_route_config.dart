import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mibloc/features/auth/presentation/bloc/auth/auth_bloc.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
        ),
        GoRoute(
          path: '/register',
          name: 'register',
        ),
        GoRoute(
          path: '/home',
          name: 'home',
        ),
      ],
      redirect: _guard);

  static String? _guard(BuildContext context, GoRouterState state) {
    if (context.read<AuthBloc>().state is AuthLoginSuccessState) {
      return '/home';
    }

    if (context.read<AuthBloc>().state is AuthCheckStatusLoadingState) {
      return '/splash';
    }

    if (context.read<AuthBloc>().state is AuthCheckStatusFailureState) {
      return '/login';
    }

    if (context.read<AuthBloc>().state is AuthLogoutSuccessState) {
      return '/login';
    }

    return null;
  }
}
