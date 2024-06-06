import 'package:get_it/get_it.dart';
import 'package:mibloc/features/auth/di/auth_dependency.dart';

final getIt = GetIt.I;

void configureDependencies() {
  AuthDependency.init();
}
