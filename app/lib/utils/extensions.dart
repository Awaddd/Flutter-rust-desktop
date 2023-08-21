import 'package:flutter/material.dart';
import 'package:flutter_rust/components/snack_bar_icon.dart';
import 'package:flutter_rust/utils/constants.dart';

extension ShowSnackBar on BuildContext {
  void showNotification({
    required String message,
    bool isError = false,
  }) {
    final colors = Theme.of(this).colorScheme;

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: colors.surfaceVariant,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: [
            //
            SnackBarIcon(isError: isError),

            const SizedBox(width: sm),

            Text(
              message,
              style: TextStyle(color: colors.onBackground),
            ),
          ],
        ),
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
          textColor: colors.onSurfaceVariant,
        ),
      ),
    );
  }

  void showErrorNotification({required String message}) {
    showNotification(message: message, isError: true);
  }
}

extension StringCasingExtension on String {
  String capitalize() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize()).join(' ');
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }
}
