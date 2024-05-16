import 'package:flutter/material.dart';
import 'package:mibloc/core/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login to Regis',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(height: 24),
              const Input(label: 'Email'),
              const SizedBox(height: 16),
              const Input(label: 'Password'),
              const SizedBox(height: 24),
              Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: -0.002,
                  decoration: TextDecoration.underline,
                  color: RegisTheme.primary[400],
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.resolveWith(
                        (states) => const Size(double.infinity, 44)),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return RegisTheme.primary[400].withOpacity(0.8);
                      } else {
                        return RegisTheme.primary[400];
                      }
                    }),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.002,
                      fontFamily: 'Roboto',
                    ),
                  )),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text("Don't Have an account?",
                      style: TextStyle(
                          fontSize: 10,
                          letterSpacing: -0.002,
                          fontFamily: 'Roboto')),
                  Text("Sign up",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: RegisTheme.primary[400],
                          fontSize: 10,
                          letterSpacing: -0.002,
                          fontFamily: 'Roboto')),
                ],
              ),
            ],
          ),
        ));
  }
}

class Input extends StatelessWidget {
  const Input({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null || label!.isNotEmpty)
          Text(
            label ?? '',
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: -0.002,
              fontFamily: 'Roboto',
            ),
          ),
        if (label != null || label!.isNotEmpty) const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            constraints: const BoxConstraints(minHeight: 44),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: RegisTheme.gray[300],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
