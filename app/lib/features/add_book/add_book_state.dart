// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';

final bookControllerProvider = Provider((ref) => TextEditingController());
final authorControllerProvider = Provider((ref) => TextEditingController());

final addBookProvider = StateNotifierProvider<AddBookNotifier, AddBookState>((ref) => AddBookNotifier(ref));

class AddBookNotifier extends StateNotifier<AddBookState> {
  AddBookNotifier(this.ref) : super(AddBookState());

  final Ref ref;

  void setBookError(String? err) {
    state = AddBookState(authorError: state.authorError, bookError: err);
  }

  void setAuthorError(String? err) {
    state = AddBookState(authorError: err, bookError: state.bookError);
  }

  void saveBook(BookPartial book) {
    print("book partial ${book.title} ${book.author}");
  }
}

class AddBookState {
  AddBookState({
    this.bookError,
    this.authorError,
  });

  String? bookError;
  String? authorError;
}
