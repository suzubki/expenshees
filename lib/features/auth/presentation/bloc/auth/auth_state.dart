part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

/// State flow for user registration
class AuthRegisterLoadingState extends AuthState {}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterFailureState extends AuthState {
  const AuthRegisterFailureState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

/// State flow for user login
class AuthLoginLoadingState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  const AuthLoginSuccessState({required this.user});

  final AuthenticatedUser user;

  @override
  List<Object?> get props => [user];
}

class AuthLoginFailureState extends AuthState {
  const AuthLoginFailureState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

/// State flow for user logout
class AuthLogoutLoadingState extends AuthState {}

class AuthLogoutSuccessState extends AuthState {}

class AuthLogoutFailureState extends AuthState {
  const AuthLogoutFailureState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

/// State flow for checking user status, whether logged in or not
class AuthCheckStatusLoadingState extends AuthState {}

class AuthCheckStatusSuccessState extends AuthState {
  const AuthCheckStatusSuccessState({required this.user});

  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthCheckStatusFailureState extends AuthState {
  const AuthCheckStatusFailureState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
