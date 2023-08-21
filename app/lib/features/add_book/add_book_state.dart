// ignore_for_file: use_setters_to_change_properties
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/models/book.dart';
import 'package:flutter_rust/network/api.dart';
import 'package:flutter_rust/utils/types.dart';

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

  Future<Book> saveBook(BookPartial payload) async {
    final response = await Client.post(Client.paths.postBook, payload.toJson());

    Item book = {};
    final body = jsonDecode(response.body);

    if (body case {'data': {'book': final Item item}}) book = item;

    return Book.fromNetwork(book);
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
