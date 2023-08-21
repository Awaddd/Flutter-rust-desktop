import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/router/router_config.dart';
import 'package:flutter_rust/utils/extensions.dart';

final navDrawerIndexProvider = StateProvider((ref) => 0);
final destinationsProvider = Provider((ref) => destinations);
final labelDestinationsProvider = Provider((ref) => labelDestinations);

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

class Destination extends ExampleDestination {
  Destination(
    super.label,
    super.icon,
    super.selectedIcon, {
    required this.path,
  });

  final String path;
}

List<ExampleDestination> destinations = [
  Destination(Routes.home.name.capitalize(), const Icon(Icons.cottage_outlined), const Icon(Icons.cottage), path: Routes.home.path),
  Destination(
    'Books',
    const Icon(Icons.book_outlined),
    const Icon(Icons.book),
    path: Routes.books.path,
  ),
  Destination(
    'Add Book',
    const Icon(Icons.add_outlined),
    const Icon(Icons.add),
    path: Routes.addBook.path,
  ),
  Destination(Routes.settings.name.capitalize(), const Icon(Icons.settings_outlined), const Icon(Icons.settings), path: Routes.settings.path),
];

const List<ExampleDestination> labelDestinations = <ExampleDestination>[
  ExampleDestination(
    'Books',
    Icon(Icons.bookmark_border),
    Icon(Icons.bookmark),
  ),
  ExampleDestination(
    'Authors',
    Icon(Icons.bookmark_border),
    Icon(Icons.bookmark),
  ),
  ExampleDestination('Recommended', Icon(Icons.bookmark_border), Icon(Icons.bookmark)),
];
