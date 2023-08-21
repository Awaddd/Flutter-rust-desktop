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
  Destination(Routes.settings.name.capitalize(), const Icon(Icons.settings_outlined), const Icon(Icons.settings), path: Routes.settings.path),
  const ExampleDestination(
    'Favorites',
    Icon(Icons.favorite_outline),
    Icon(Icons.favorite),
  ),
  const ExampleDestination('Trash', Icon(Icons.delete_outline), Icon(Icons.delete)),
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
