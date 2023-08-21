import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/state/books.dart';
import 'package:flutter_rust/utils/constants.dart';
import 'package:flutter_rust/utils/extensions.dart';
import 'package:flutter_rust/utils/utils.dart';

class AllBooks extends ConsumerWidget {
  const AllBooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final books = ref.watch(booksProvider);

    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return books.when(
      data: (b) => BookList(books: b),
      error: (error, stackTrace) => Text(
        'Error! Something went wrong',
        style: text.titleMedium?.copyWith(color: colors.error),
      ),
      loading: () => const Expanded(child: Center(child: CircularProgressIndicator())),
    );
  }
}

class BookList extends ConsumerWidget {
  const BookList({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final subtitleColor = Theme.of(context).hintColor;
    final text = Theme.of(context).textTheme;

    Future<void> delete(Book book) async {
      final result = await ref.read(booksProvider.notifier).removeBook(book.isbn);
      if (!context.mounted) return;
      if (isEmpty(result.error)) return context.showNotification(message: "Book deleted");
      context.showErrorNotification(message: result.error!);
    }

    return Expanded(
      child: ListView.separated(
        itemCount: books.length,
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index) {
          final book = books[index];

          return ListTile(
            contentPadding: const EdgeInsets.only(right: xl),
            title: Text(book.title, style: text.bodyMedium?.copyWith(color: colors.primary, fontWeight: FontWeight.w600)),
            subtitle: Text(book.author, style: text.bodySmall?.copyWith(color: subtitleColor)),
            trailing: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth / 2.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //
                      Flexible(
                        child: Text(
                          book.isbn,
                          style: TextStyle(color: colors.secondary),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(width: md),

                      IconButton(
                        onPressed: () => delete(book),
                        icon: const Icon(Icons.delete_outline),
                        iconSize: 22,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
