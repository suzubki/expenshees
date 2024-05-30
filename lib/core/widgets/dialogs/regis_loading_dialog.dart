import 'package:flutter/material.dart';

class RegisLoadingDialog extends StatelessWidget {
  const RegisLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      content: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
