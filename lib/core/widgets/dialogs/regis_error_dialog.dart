import 'package:flutter/material.dart';
import 'package:mibloc/core/extensions/extensions.dart';
import 'package:mibloc/core/theme.dart';
import 'package:mibloc/core/widgets/buttons/regis_filled_button.dart';

class RegisErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final Function()? onConfirm;

  const RegisErrorDialog(
      {super.key,
      required this.title,
      required this.content,
      this.confirmText = 'OK',
      this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.height,
            Icon(Icons.error,
                color: RegisTheme.primary[400], size: 96), // Add this line
            24.height,
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            24.height,
            Text(
              content,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            32.height,
            RegisFilledButton(
                onPressed: () {
                  onConfirm?.call();
                  Navigator.of(context).pop();
                },
                child: Text(confirmText)),
          ],
        ),
      ),
    );
  }
}
