import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/components/atoms/full_width_button.dart';
import 'package:flutter_rust/components/atoms/full_width_input.dart';
import 'package:flutter_rust/utils/constants.dart';

final bookControllerProvider = Provider((ref) => TextEditingController());
final authorControllerProvider = Provider((ref) => TextEditingController());

class AddBookForm extends ConsumerWidget {
  const AddBookForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookController = ref.watch(bookControllerProvider);
    final authorController = ref.watch(authorControllerProvider);

    return Column(
      children: [
        //
        FullWidthInput(
          text: 'Book',
          controller: bookController,
          dense: true,
        ),

        const SizedBox(height: md),

        FullWidthInput(
          text: 'Author',
          controller: authorController,
          dense: true,
        ),

        const SizedBox(height: md),

        FullWidthButton(
          onPressed: () {},
          text: 'Add Book',
        ),
      ],
    );
  }
}
