import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mibloc/core/configs/injector_config.dart';
import 'package:mibloc/core/theme.dart';
import 'package:mibloc/core/utils/bloc_observer.dart';
import 'package:mibloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mibloc/firebase_options.dart';
import 'package:mibloc/routes/app_route_config.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
    // androidProvider: AndroidProvider.playIntegrity,
    // appleProvider: AppleProvider.appAttest,
  );

  // Initialize the dependency injection
  configureDependencies();

  // Initialize the Bloc observer, which will log all Bloc events
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
