import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mibloc/features/auth/domain/entities/__entities.dart';
import 'package:mibloc/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({
    required this.loginUseCase,
  }) : super(AuthInitialState()) {
    on<AuthLoginEvent>((event, emit) async {
      await _login(event, emit);
    });
  }

  Future _login(AuthLoginEvent event, Emitter emit) async {
    emit(AuthLoginLoadingState());

    final result = await loginUseCase
        .call(LoginParams(email: event.email, password: event.password));

    result.fold(
      (failure) {
        emit(const AuthLoginFailureState(message: 'Login failed'));
      },
      (user) {
        emit(AuthLoginSuccessState(user: user));
      },
    );
  }
}
