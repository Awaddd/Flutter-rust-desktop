import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/state/navigation.dart';
import 'package:go_router/go_router.dart';

class NavigationDrawerSection extends ConsumerWidget {
  const NavigationDrawerSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navDrawerIndex = ref.watch(navDrawerIndexProvider);

    final mainDestinations = ref.read(destinationsProvider);
    final labelDestinations = ref.read(labelDestinationsProvider);
    final destinations = [...mainDestinations, ...labelDestinations];

    return NavigationDrawer(
      onDestinationSelected: (selectedIndex) {
        ref.read(navDrawerIndexProvider.notifier).state = selectedIndex;

        final destination = destinations[selectedIndex];

        if (destination is Destination) {
          context.go(destination.path);
        }
      },
      selectedIndex: navDrawerIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Bookio',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...mainDestinations.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
        const Divider(indent: 28, endIndent: 28),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Labels',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ...labelDestinations.map((destination) {
          return NavigationDrawerDestination(
            label: Text(destination.label),
            icon: destination.icon,
            selectedIcon: destination.selectedIcon,
          );
        }),
      ],
    );
  }
}
