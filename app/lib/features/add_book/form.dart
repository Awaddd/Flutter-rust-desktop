import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/components/atoms/full_width_button.dart';
import 'package:flutter_rust/components/atoms/full_width_input.dart';
import 'package:flutter_rust/features/add_book/add_book_state.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/utils/constants.dart';
import 'package:flutter_rust/utils/utils.dart';

class AddBookForm extends ConsumerWidget {
  const AddBookForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(addBookProvider);
    final bookController = ref.watch(bookControllerProvider);
    final authorController = ref.watch(authorControllerProvider);

    final book = ref.watch(bookProvider);

    Future<void> addBook() async {
      final book = bookController.text;
      final author = authorController.text;

      final addBookState = ref.read(addBookProvider.notifier);

      if (isEmpty(book)) return addBookState.setBookError("Book cannot be empty");
      if (isEmpty(author)) return addBookState.setAuthorError("Author cannot be empty");

      addBookState.saveBook(BookPartial(title: book, author: author));
    }

    return Expanded(
      child: Column(
        children: [
          //
          FullWidthInput(
            text: 'Book',
            dense: true,
            controller: bookController,
            error: formState.bookError,
            onChanged: (val) {
              if (isEmpty(formState.bookError)) return;
              ref.read(addBookProvider.notifier).setBookError(null);
            },
          ),

          const SizedBox(height: md),

          FullWidthInput(
            text: 'Author',
            dense: true,
            controller: authorController,
            error: formState.authorError,
            onChanged: (val) {
              if (isEmpty(formState.authorError)) return;
              ref.read(addBookProvider.notifier).setAuthorError(null);
            },
          ),

          if (book != null) BookPreview(book: book),

          const Spacer(),

          FullWidthButton(
            onPressed: addBook,
            text: 'Add Book',
          ),
        ],
      ),
    );
  }
}

class BookPreview extends StatelessWidget {
  const BookPreview({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final subtitleColor = Theme.of(context).hintColor;
    final text = Theme.of(context).textTheme;
    final color = Theme.of(context).hintColor;

    return Column(
      children: [
        //
        const SizedBox(height: xl),

        Row(
          children: [
            Text(
              "Book Preview",
              style: text.labelLarge?.copyWith(fontWeight: FontWeight.w500, color: color),
            ),
          ],
        ),

        ListTile(
          contentPadding: const EdgeInsets.only(right: xl),
          title: Text(book.title, style: text.bodyMedium?.copyWith(color: colors.primary, fontWeight: FontWeight.w600)),
          subtitle: Text(book.author, style: text.bodySmall?.copyWith(color: subtitleColor)),
          trailing: Text(book.isbn, style: TextStyle(color: colors.secondary)),
        ),
      ],
    );
  }
}
