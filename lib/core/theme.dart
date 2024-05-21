import 'package:flutter/material.dart';

class RegisTheme {
  static const Map<int, dynamic> gray = {
    300: Color(0xFFD7D7D7),
    400: Color(0xFFBDBDBD),
  };

  static const Map<int, dynamic> primary = {
    400: Color(0xFF277EFF),
  };

  static ThemeData theme() {
    return ThemeData(
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'Roboto',
          letterSpacing: -0.002,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.002,
          fontFamily: 'Roboto',
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          letterSpacing: -0.002,
          fontFamily: 'Roboto',
        ),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: RegisTheme.primary[400]),
      useMaterial3: true,
      fontFamily: 'Roboto',
    );
  }
}
