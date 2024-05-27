import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mibloc/core/extensions/extensions.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class AuthLoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  AuthLoginFormBloc() : super(const LoginFormInitialState()) {
    on<LoginFormEmailChangedEvent>(_emailChanged);
    on<LoginFormPasswordChangedEvent>(_passwordChanged);
  }

  Future _emailChanged(LoginFormEmailChangedEvent event, Emitter emit) async {
    emit(LoginFormDataState(
      inputEmail: event.email,
      inputPassword: state.password,
      inputIsValid: _isValid(event.email, state.password),
    ));
  }

  Future _passwordChanged(
      LoginFormPasswordChangedEvent event, Emitter emit) async {
    emit(LoginFormDataState(
      inputEmail: state.email,
      inputPassword: event.password,
      inputIsValid: _isValid(state.email, event.password),
    ));
  }

  bool _isValid(String email, String password) {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        email.isEmailValid &&
        password.isPasswordValid;
  }
}
