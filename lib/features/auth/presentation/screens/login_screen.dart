import 'package:flutter/material.dart';
import 'package:mibloc/core/theme.dart';
import 'package:mibloc/core/widgets/buttons/__butons.dart';
import 'package:mibloc/core/widgets/inputs/regis_input.dart';
import 'package:mibloc/core/widgets/inputs/regis_text_field.dart';
import 'package:mibloc/core/widgets/regis_scaffold.dart';
import 'package:mibloc/core/extensions/extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kToolbarHeight.height,
          Text(
            'Login to Regis',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          24.height,
          // const RegisInput(label: 'Email'),
          RegisTextField(
              validatorLabel: RegisTextFieldValidator.email,
              isRequired: true,
              onChanged: (val) {
                return null;
              }),
          16.height,
          const RegisInput(label: 'Password'),
          24.height,
          Text(
            'Forgot your password?',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: RegisTheme.primary[400],
                decoration: TextDecoration.underline),
          ),
          const SizedBox(height: 24),
          RegisFilledButton(
            onPressed: () {},
            child: Text(
              'Login',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          24.height,
          Row(
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
          ),
        ],
      ),
    );
  }
}
