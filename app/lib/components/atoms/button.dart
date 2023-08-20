import 'package:flutter/material.dart';
import 'package:flutter_rust/utils/constants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.icon,
  });

  final String text;
  final void Function()? onPressed;
  final Color? color;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: icon!,
        label: Text(text),
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: lg),
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(xs)),
          ),
        ),
      );
    }

    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: lg),
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(xs)),
        ),
      ),
      child: Text(text),
    );
  }
}
