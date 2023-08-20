import 'package:flutter/material.dart';
import 'package:flutter_rust/utils/input_decoration.dart';

class FullWidthInput extends StatelessWidget {
  const FullWidthInput({
    super.key,
    this.controller,
    this.onTapOutside,
    this.onChanged,
    required this.text,
    this.maxLength,
    this.enabled = true,
    this.maxLines,
    this.dense = false,
    this.error,
  });

  final TextEditingController? controller;
  final void Function(PointerDownEvent p1)? onTapOutside;
  final void Function(String text)? onChanged;
  final String text;
  final int? maxLength;
  final bool enabled;
  final int? maxLines;
  final bool dense;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: controller,
      onTapOutside: onTapOutside,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: inputDecoration(context, text: text, dense: dense, error: error),
    );
  }
}
