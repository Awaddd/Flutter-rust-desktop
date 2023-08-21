import 'package:flutter/material.dart';
import 'package:flutter_rust/features/books/all_books.dart';
import 'package:flutter_rust/utils/constants.dart';

class Books extends StatelessWidget {
  const Books({super.key});

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
              "Bookio",
              style: text.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),

        const SizedBox(height: xs),

        //
        Row(
          children: [
            Text(
              "List of all books",
              style: text.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: color),
            ),
          ],
        ),

        const AllBooks(),
      ],
    );
  }
}
