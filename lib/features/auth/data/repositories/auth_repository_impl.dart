import 'package:fpdart/fpdart.dart';
import 'package:mibloc/core/errors/exception.dart';
import 'package:mibloc/core/errors/failure.dart';
import 'package:mibloc/features/auth/data/datasources/remote/auth_datasource_remote_impl.dart';
import 'package:mibloc/features/auth/data/models/login_model.dart';
import 'package:mibloc/features/auth/domain/entities/__entities.dart';
import 'package:mibloc/features/auth/domain/repositories/__repositores.dart';
import 'package:mibloc/features/auth/domain/usecases/login_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthenticatedUser>> signInWithEmailAndPassword(
      LoginParams params) async {
    try {
      final model = LoginModel(email: params.email, password: params.password);

      final result = await _remoteDataSource.signInWithEmailAndPassword(model);

      return Right(result);
    } on AuthException {
      return Left(CredentialFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> signOut() async {
    return await Future.value();
  }

  @override
  Future<bool> isSignedIn() async {
    return await Future.value(true);
  }

  @override
  Future<String> getUser() async {
    return await Future.value('user');
  }
}
