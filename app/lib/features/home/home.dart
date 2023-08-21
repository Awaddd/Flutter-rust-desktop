import 'package:flutter/material.dart';
import 'package:flutter_rust/features/home/books.dart';
import 'package:flutter_rust/utils/constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        Row(
          children: [
            Text(
              "Bookio",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),

        const SizedBox(height: lg),

        const Books(),
      ],
    );
  }
}
