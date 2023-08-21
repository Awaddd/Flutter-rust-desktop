import 'package:flutter/material.dart';
import 'package:flutter_rust/features/add_book/form.dart';
import 'package:flutter_rust/utils/constants.dart';

class AddBook extends StatelessWidget {
  const AddBook({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).hintColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        Row(
          children: [
            Text(
              "Add Book",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),

        const SizedBox(height: xs),

        //
        Row(
          children: [
            Text(
              "Add a new book using the form below",
              style: text.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: color),
            ),
          ],
        ),

        const SizedBox(height: xl),

        const AddBookForm(),
      ],
    );
  }
}
