import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mibloc/core/errors/failure.dart';
import 'package:mibloc/features/auth/domain/entities/__entities.dart';
import 'package:mibloc/features/auth/domain/usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthenticatedUser>> signInWithEmailAndPassword(
      LoginParams params);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<Either<Failure, UserCredential>> signUpWithGoogleProvider();
  Future<void> signUpWithAppleProvider();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
}
