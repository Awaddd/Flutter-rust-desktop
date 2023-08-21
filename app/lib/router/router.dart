import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rust/features/add_book/add_book.dart';
import 'package:flutter_rust/features/books/books.dart';
import 'package:flutter_rust/features/home/home.dart';
import 'package:flutter_rust/features/settings/settings.dart';
import 'package:flutter_rust/layouts/main_layout.dart';
import 'package:flutter_rust/router/router_config.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: Routes.home.name,
        path: Routes.home.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage(
            child: MainLayout(child: Home()),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: Routes.settings.name,
        path: Routes.settings.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage(
            child: MainLayout(child: Settings()),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: Routes.books.name,
        path: Routes.books.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage(
            child: MainLayout(child: Books()),
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        name: Routes.addBook.name,
        path: Routes.addBook.path,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage(
            child: MainLayout(child: AddBook()),
          );
        },
      ),
    ],
  );
});
