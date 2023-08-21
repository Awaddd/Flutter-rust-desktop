import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/network/api.dart';
import 'package:http/http.dart' as client;

typedef BookProvider = AsyncValue<List<Book>>;

final bookProvider = StateNotifierProvider<BookNotifier, BookProvider>((ref) => BookNotifier(ref));

class BookNotifier extends StateNotifier<BookProvider> {
  BookNotifier(this.ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  final Ref ref;

  Future<void> _fetch() async {
    final url = Uri.parse("$api/books");

    state = await AsyncValue.guard(() async {
      final response = await client.get(url);

      final List<Book> books = [];

      if (response.statusCode == 200) {
        final x = jsonDecode(response.body);
        final p = (x['data'] as Map<String, dynamic>)['books']! as List<dynamic>;

        for (final (book as Map<String, dynamic>) in p) {
          final b = Book.fromNetwork(book);
          books.add(b);
        }
      }

      return books;
      // api call
      // return book array
    });
  }
}
