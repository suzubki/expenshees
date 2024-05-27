part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

final class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const AuthRegisterEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [email, password, confirmPassword];
}

final class AuthLogoutEvent extends AuthEvent {}

final class AuthCheckStatusEvent extends AuthEvent {}
