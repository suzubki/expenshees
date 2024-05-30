import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mibloc/core/constants/error_strings.dart';
import 'package:mibloc/core/errors/failure.dart';
import 'package:mibloc/features/auth/domain/entities/__entities.dart';
import 'package:mibloc/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLoginUseCase _loginUseCase;

  AuthBloc(
    this._loginUseCase,
  ) : super(AuthInitialState()) {
    on<AuthLoginEvent>((event, emit) async {
      await _login(event, emit);
    });
  }

  Future _login(AuthLoginEvent event, Emitter emit) async {
    emit(AuthLoginLoadingState());

    final result = await _loginUseCase
        .call(LoginParams(email: event.email, password: event.password));

    result.fold(
      (failure) {
        if (failure is CredentialFailure) {
          emit(const AuthLoginFailureState(
              message: ErrorStrings.badCredentials));
        } else if (failure is ServerFailure) {
          emit(const AuthLoginFailureState(message: ErrorStrings.serverError));
        } else {
          emit(const AuthLoginFailureState(message: ErrorStrings.unknownError));
        }
      },
      (user) {
        emit(AuthLoginSuccessState(user: user));
      },
    );
  }
}
