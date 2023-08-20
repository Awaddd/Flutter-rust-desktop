import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Bookio",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ],
    );
  }
}
