import 'package:flutter/material.dart';
import 'package:flutter_rust/components/navigation_drawer.dart';
import 'package:flutter_rust/utils/constants.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    required this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Row(
          children: [
            //
            NavigationDrawerSection(key: GlobalKey()),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: md, horizontal: rl),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
