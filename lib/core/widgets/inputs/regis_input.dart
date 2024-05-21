import 'package:flutter/material.dart';
import 'package:mibloc/core/theme.dart';

class RegisInput extends StatelessWidget {
  const RegisInput({super.key, this.label});

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
