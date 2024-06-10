import 'package:flutter/material.dart';
import 'package:mibloc/core/theme.dart';

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
