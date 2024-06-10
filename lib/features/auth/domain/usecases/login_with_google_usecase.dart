import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mibloc/core/errors/failure.dart';
import 'package:mibloc/features/auth/domain/repositories/__repositores.dart';

class AuthLoginWithGoogleUseCase {
  final AuthRepository _repository;

  const AuthLoginWithGoogleUseCase(this._repository);

  Future<Either<Failure, UserCredential>> call() async {
    return await _repository.signUpWithGoogleProvider();
  }
}
