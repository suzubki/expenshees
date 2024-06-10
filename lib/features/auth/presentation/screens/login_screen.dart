import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mibloc/core/constants/assets.dart';
import 'package:mibloc/core/configs/injector_config.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/theme.dart';
import 'package:mibloc/core/widgets/buttons/__butons.dart';
import 'package:mibloc/core/widgets/dialogs/__dialogs.dart';
import 'package:mibloc/core/widgets/regis_scaffold.dart';
import 'package:mibloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:mibloc/features/auth/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:mibloc/features/auth/presentation/widgets/__widgets.dart';
// import 'package:mibloc/routes/assets.dart';

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
                return RegisFilledButton(
                  onPressed: () => _login(context),
                  child: Text(
                    'Sign in',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                );
              },
              listener: (_, state) {
                if (state is AuthLoginLoadingState) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => const RegisLoadingDialog());
                }

                if (state is AuthLoginFailureState) {
                  Navigator.of(context).pop();

                  showDialog(
                      context: context,
                      builder: (_) => RegisErrorDialog(
                            title: 'Sign in failed',
                            content: state.message,
                            confirmText: 'OK',
                          ));
                }

                if (state is AuthLoginSuccessState) {
                  Navigator.of(context).pop();
                }
              },
            ),
            24.height,
            const SignUpSuggestion(),
            24.height,
            RegisFilledButton(
                hasBorder: true,
                color: RegisTheme.gray[100],
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsAssets.google, width: 20, height: 20),
                    8.width,
                    const Text('Sign up with Google',
                        style: TextStyle(color: Colors.black)),
                  ],
                )),
            12.height,
            RegisFilledButton(
                hasBorder: true,
                color: RegisTheme.gray[100],
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconsAssets.apple, width: 20, height: 20),
                    8.width,
                    const Text('Sign up with Apple',
                        style: TextStyle(color: Colors.black)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
