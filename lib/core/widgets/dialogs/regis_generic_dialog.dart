import 'package:flutter/material.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/widgets/buttons/regis_filled_button.dart';

class RegisGenericDialog extends StatelessWidget {
  final String title;
  final String content;

  const RegisGenericDialog(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            16.height,
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            16.height,
            RegisFilledButton(onPressed: () {}, child: const Text('OK')),
          ],
        ),
      ),
    );
  }
}
