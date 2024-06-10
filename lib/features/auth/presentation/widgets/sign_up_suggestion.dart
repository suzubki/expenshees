import 'package:flutter/material.dart';
import 'package:mibloc/core/theme.dart';

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
