import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/widgets/inputs/regis_text_field.dart';
import 'package:mibloc/features/auth/presentation/bloc/login_form/login_form_bloc.dart';

class AuthInputFields extends StatelessWidget {
  const AuthInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<AuthLoginFormBloc>();

    return Column(
      children: [
        RegisTextField(
            keyboardType: TextInputType.emailAddress,
            validatorLabel: RegisTextFieldValidator.email,
            isRequired: true,
            onChanged: (val) {
              formBloc.add(LoginFormEmailChangedEvent(email: val));
            }),
        24.height,
        RegisTextField(
            obscureText: true,
            validatorLabel: RegisTextFieldValidator.password,
            isRequired: true,
            onChanged: (val) {
              formBloc.add(LoginFormPasswordChangedEvent(password: val));
            }),
      ],
    );
  }
}
