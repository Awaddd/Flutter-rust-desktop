import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/state/books.dart';
import 'package:flutter_rust/utils/constants.dart';

class Books extends ConsumerWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(bookProvider);

    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return books.when(
      data: (b) => BookList(books: b),
      error: (error, stackTrace) => Text(
        'Error! Something went wrong',
        style: text.titleLarge?.copyWith(color: colors.error),
      ),
      loading: () => const Center(child: LinearProgressIndicator()),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Expanded(
      child: ListView.separated(
        itemCount: books.length,
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemBuilder: (context, index) {
          final book = books[index];

          return ListTile(
            contentPadding: const EdgeInsets.only(right: xl),
            title: Text(book.title, style: TextStyle(color: colors.primary)),
            subtitle: Text(book.author, style: TextStyle(color: Theme.of(context).hintColor)),
            trailing: Text(book.isbn, style: TextStyle(color: colors.secondary)),
          );
        },
      ),
    );
  }
}
