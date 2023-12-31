import 'package:flutter/material.dart';
import 'package:flutter_rust/utils/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).hintColor;

    return Column(
      children: [
        //
        Row(
          children: [
            Text(
              "Sahib",
              style: text.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),

        const SizedBox(height: xs),

        //
        Row(
          children: [
            Text(
              "Your companian app",
              style: text.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: color),
            ),
          ],
        ),

        const SizedBox(height: lg),
      ],
    );
  }
}
