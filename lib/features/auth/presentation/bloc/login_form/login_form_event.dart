part of 'login_form_bloc.dart';

@immutable
sealed class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object?> get props => [];
}

class LoginFormEmailChangedEvent extends LoginFormEvent {
  final String email;

  const LoginFormEmailChangedEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class LoginFormPasswordChangedEvent extends LoginFormEvent {
  final String password;

  const LoginFormPasswordChangedEvent({
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}
