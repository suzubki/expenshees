import 'package:flutter/material.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/theme.dart';

enum RegisTextFieldValidator {
  email,
  password,
  name,
}

class RegisTextField extends StatefulWidget {
  const RegisTextField({
    super.key,
    this.onChanged,
    required this.validatorLabel,
    this.keyboardType = TextInputType.text,
    this.isRequired = true,
    this.obscureText = false,
  });

  final RegisTextFieldValidator validatorLabel;
  final void Function(String)? onChanged;
  final bool isRequired;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  State<RegisTextField> createState() => _RegisTextFieldState();
}

class _RegisTextFieldState extends State<RegisTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        constraints: const BoxConstraints(minHeight: 44),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: RegisTheme.gray[300],
          ),
        ),
      ),
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        if (!widget.isRequired) return null;

        if (val == null || val.isEmpty) {
          return 'This field is required';
        }

        if (widget.validatorLabel == RegisTextFieldValidator.email &&
            !val.isEmailValid) {
          return 'This email is not valid';
        }

        if (widget.validatorLabel == RegisTextFieldValidator.password &&
            !val.isPasswordValid) {
          return 'Password must be at least 8 characters and probably doesn\'t contain have the correct format';
        }

        return null;
      },
    );
  }
}
