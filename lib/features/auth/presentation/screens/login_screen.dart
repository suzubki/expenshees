import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mibloc/core/configs/injector_conf.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/theme.dart';
import 'package:mibloc/core/widgets/buttons/__butons.dart';
import 'package:mibloc/core/widgets/regis_scaffold.dart';
import 'package:mibloc/core/widgets/snackbar/regis_snackbar.dart';
import 'package:mibloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mibloc/features/auth/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:mibloc/features/auth/presentation/widgets/auth_input_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _login(BuildContext context) {
    final isValid = context.read<AuthLoginFormBloc>().state.isValid;
    if (!isValid) return;

    final authForm = context.read<AuthLoginFormBloc>().state;
    context.read<AuthBloc>().add(AuthLoginEvent(
          email: authForm.email.trim(),
          password: authForm.password.trim(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthLoginFormBloc>(),
      child: RegisScaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kToolbarHeight.height,
            Text(
              'Login to Regis',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            24.height,
            const AuthInputFields(),
            24.height,
            const ForgotYourPasswordSuggestion(),
            24.height,
            BlocConsumer<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoginLoadingState) {
                  return const CircularProgressIndicator();
                }

                return RegisFilledButton(
                  onPressed: () => _login(context),
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                );
              },
              listener: (_, state) {
                if (state is AuthLoginFailureState) {
                  regisSnackbar(context, state.message);
                }
              },
            ),
            24.height,
            const SignUpSuggestion(),
          ],
        ),
      ),
    );
  }
}

class ForgotYourPasswordSuggestion extends StatelessWidget {
  const ForgotYourPasswordSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Forgot your password?',
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: RegisTheme.primary[400], decoration: TextDecoration.underline),
    );
  }
}

class SignUpSuggestion extends StatelessWidget {
  const SignUpSuggestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Don't Have an account?",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          "Sign up",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: RegisTheme.primary[400],
              decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
