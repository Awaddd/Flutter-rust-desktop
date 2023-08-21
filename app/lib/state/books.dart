import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/network/api.dart';

typedef BookProvider = AsyncValue<List<Book>>;
typedef T = Map<String, dynamic>?;

final bookProvider = StateNotifierProvider<BookNotifier, BookProvider>((ref) => BookNotifier(ref));

class BookNotifier extends StateNotifier<BookProvider> {
  BookNotifier(this.ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  final Ref ref;

  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final response = await Client.get(Client.paths.getBooks);

      final List<Book> books = [];

      final body = jsonDecode(response.body) as T;
      final bookList = (body?['data'] as T)?['books'] as List<dynamic>;

      for (final (book as Map<String, dynamic>) in bookList) {
        final b = Book.fromNetwork(book);
        books.add(b);
      }

      return books;
    });
  }
}
