import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mibloc/core/configs/injector_config.dart';
import 'package:mibloc/core/theme.dart';
import 'package:mibloc/core/utils/bloc_observer.dart';
import 'package:mibloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mibloc/routes/app_route_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  Bloc.observer = RegisBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<AuthBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: RegisTheme.theme(),
      routerConfig: AppRouter.router,
    );
  }
}
