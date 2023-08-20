import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/state/router.dart';
import 'package:flutter_rust/utils/color_schemes.g.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Flutter Rust',
      debugShowCheckedModeBanner: false,
      routerConfig: goRouter,
      theme: ThemeData(useMaterial3: true, colorScheme: colorScheme),
    );
  }
}
