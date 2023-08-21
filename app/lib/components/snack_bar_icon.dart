import 'package:flutter/material.dart';

class SnackBarIcon extends StatelessWidget {
  const SnackBarIcon({
    super.key,
    this.isError = false,
  });

  final bool isError;

  @override
  Widget build(BuildContext context) {
    const double size = 24;

    if (isError) return const Icon(Icons.error_outline, size: size, color: Colors.amber);
    return const Icon(Icons.done, size: size, color: Colors.green);
  }
}
