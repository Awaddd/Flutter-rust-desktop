// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookControllerProvider = Provider((ref) => TextEditingController());
final authorControllerProvider = Provider((ref) => TextEditingController());

final addBookProvider = StateNotifierProvider<AddBookNotifier, AddBookFormState>((ref) => AddBookNotifier(ref));

class AddBookNotifier extends StateNotifier<AddBookFormState> {
  AddBookNotifier(this.ref) : super(AddBookFormState());

  final Ref ref;

  void setBookError(String? err) {
    state = AddBookFormState(authorError: state.authorError, bookError: err);
  }

  void setAuthorError(String? err) {
    state = AddBookFormState(authorError: err, bookError: state.bookError);
  }
}

class AddBookFormState {
  AddBookFormState({
    this.bookError,
    this.authorError,
  });

  String? bookError;
  String? authorError;
}
