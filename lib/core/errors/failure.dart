import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// --------------------- Common Failures ---------------------
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class EmptyFailure extends Failure {}

// --------------------- Auth Failures ---------------------
class CredentialFailure extends Failure {}

class DuplicateEmailFailure extends Failure {}

class PasswordNotMatchFailure extends Failure {}

class InvalidEmailFailure extends Failure {}

class InvalidPasswordFailure extends Failure {}

class CanceledAuthorizationFailure extends Failure {}
