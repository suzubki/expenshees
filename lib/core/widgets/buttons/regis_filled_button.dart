import 'package:flutter/material.dart';
import 'package:mibloc/core/theme.dart';

class RegisFilledButton extends StatelessWidget {
  const RegisFilledButton({
    super.key,
    this.color,
    this.hasBorder = false,
    required this.onPressed,
    required this.child,
  });

  final bool hasBorder;
  final Color? color;
  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        side: hasBorder
            ? MaterialStateProperty.resolveWith(
                (states) => const BorderSide(color: Colors.black, width: 0.5),
              )
            : null,
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: MaterialStateProperty.resolveWith(
            (states) => const Size(double.infinity, 44)),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (color != null) {
            if (states.contains(MaterialState.hovered)) {
              return color!.withOpacity(0.8);
            } else {
              return color!;
            }
          }

          if (states.contains(MaterialState.hovered)) {
            return RegisTheme.primary[400].withOpacity(0.8);
          } else {
            return RegisTheme.primary[400];
          }
        }),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
