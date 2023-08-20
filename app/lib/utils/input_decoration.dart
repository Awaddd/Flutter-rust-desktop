import 'package:flutter/material.dart';
import 'package:flutter_rust/utils/constants.dart';

InputDecoration inputDecoration(
  BuildContext context, {
  String? text,
  bool dense = false,
  bool isSelect = false,
  String? error,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  EdgeInsets? padding;
  TextStyle? textStyle = TextStyle(color: colorScheme.onSurfaceVariant);

  if (dense) {
    padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12.0);
    textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant);
  }

  if (isSelect) {
    padding = const EdgeInsets.symmetric(vertical: 6, horizontal: 12.0);
  }

  return InputDecoration(
    contentPadding: padding,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.surface,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(sm)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.surface,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(sm)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorScheme.surface,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(sm)),
    ),
    fillColor: colorScheme.secondaryContainer,
    filled: true,
    hintText: text,
    hintStyle: textStyle,
    errorText: error,
  );
}
