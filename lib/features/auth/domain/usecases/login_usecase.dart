import 'package:fpdart/fpdart.dart';
import 'package:mibloc/core/errors/failure.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/usecases/usecase.dart';
import 'package:mibloc/features/auth/domain/entities/user.dart';
import 'package:mibloc/features/auth/domain/repositories/__repositores.dart';

class AuthLoginUseCase implements UseCase<AuthenticatedUser, LoginParams> {
  final AuthRepository _repository;

  const AuthLoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticatedUser>> call(LoginParams params) async {
    if (!params.email.isEmailValid) {
      return Left(InvalidEmailFailure());
    }

    if (!params.password.isPasswordValid) {
      return Left(InvalidPasswordFailure());
    }

    return await _repository.signInWithEmailAndPassword(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  List<Object?> get props => [email, password];
}
