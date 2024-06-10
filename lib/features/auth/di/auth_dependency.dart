import 'package:dio/dio.dart';
import 'package:mibloc/core/configs/injector_config.dart';
import 'package:mibloc/features/auth/data/datasources/remote/auth_datasource_remote_impl.dart';
import 'package:mibloc/features/auth/data/repositories/__repositories.dart';
import 'package:mibloc/features/auth/domain/usecases/login_usecase.dart';
import 'package:mibloc/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:mibloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mibloc/features/auth/presentation/bloc/login_form/login_form_bloc.dart';

class AuthDependency {
  AuthDependency._();

  static void init() {
    getIt.registerFactory(() => AuthBloc(
          getIt<AuthLoginUseCase>(),
          getIt<AuthLoginWithGoogleUseCase>(),
        ));

    getIt.registerFactory(() => AuthLoginFormBloc());

    getIt.registerLazySingleton(() => AuthRepositoryImpl(
          getIt<AuthRemoteDataSourceImpl>(),
        ));

    getIt.registerLazySingleton(() => AuthRemoteDataSourceImpl(Dio()));

    getIt.registerLazySingleton(() => AuthLoginUseCase(
          getIt<AuthRepositoryImpl>(),
        ));

    getIt.registerLazySingleton(() => AuthLoginWithGoogleUseCase(
          getIt<AuthRepositoryImpl>(),
        ));
  }
}
