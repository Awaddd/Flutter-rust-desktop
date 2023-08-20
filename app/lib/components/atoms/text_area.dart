import 'package:flutter/material.dart';
import 'package:flutter_rust/utils/input_decoration.dart';

class TextArea extends StatelessWidget {
  const TextArea({
    super.key,
    required this.text,
    this.controller,
    this.onTapOutside,
    this.maxLength,
    this.enabled = true,
    this.maxLines,
  });

  final String text;
  final TextEditingController? controller;
  final void Function(PointerDownEvent)? onTapOutside;
  final int? maxLength;
  final bool enabled;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        enabled: enabled,
        controller: controller,
        onTapOutside: onTapOutside,
        maxLength: maxLength,
        maxLines: maxLines,
        decoration: inputDecoration(context, text: text),
      ),
    );
  }
}
