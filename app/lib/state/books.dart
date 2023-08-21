import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/network/api.dart';
import 'package:flutter_rust/utils/types.dart';

typedef BookProvider = AsyncValue<List<Book>>;

final booksProvider = StateNotifierProvider<BookNotifier, BookProvider>((ref) => BookNotifier(ref));

class BookNotifier extends StateNotifier<BookProvider> {
  BookNotifier(this.ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  final Ref ref;

  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final response = await Client.get(Client.paths.getBooks);

      final List<Book> books = [];
      final body = jsonDecode(response.body);

      if (body case {'data': {'books': final List<dynamic> bookList}}) {
        for (final (book as Item) in bookList) {
          books.add(Book.fromNetwork(book));
        }
      }

      return books;
    });
  }

  void appendBook(Book payload) {
    final arr = [...?state.value];
    arr.add(payload);
    state = AsyncValue.data(arr);
  }
}
