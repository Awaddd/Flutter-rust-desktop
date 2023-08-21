import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';

typedef BookProvider = AsyncValue<List<Book>>;

final bookProvider = StateNotifierProvider<BookNotifier, BookProvider>((ref) => BookNotifier(ref));

class BookNotifier extends StateNotifier<BookProvider> {
  BookNotifier(this.ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  final Ref ref;

  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      // api call
      // return book array
    });
  }
}
