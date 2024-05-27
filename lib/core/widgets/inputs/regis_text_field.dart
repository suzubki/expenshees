import 'package:flutter/material.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/theme.dart';

enum RegisTextFieldValidator {
  email,
  password,
  name,
}

class RegisTextField extends StatelessWidget {
  const RegisTextField(
      {super.key,
      this.onChanged,
      required this.validatorLabel,
      this.isRequired = true});

  final RegisTextFieldValidator validatorLabel;
  final void Function(String)? onChanged;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: 44),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: RegisTheme.gray[300],
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        if (!isRequired) return null;

        if (val == null || val.isEmpty) {
          return 'This field is required';
        }

        if (validatorLabel == RegisTextFieldValidator.email &&
            !val.isEmailValid) {
          return 'This email is not valid';
        }

        if (validatorLabel == RegisTextFieldValidator.password &&
            !val.isPasswordValid) {
          return 'Password must be at least 8 characters and probably doesn\'t contain have the correct format';
        }

        return null;
      },
    );
  }
}
