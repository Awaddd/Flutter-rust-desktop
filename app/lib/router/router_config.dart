// ignore_for_file: avoid_classes_with_only_static_members
import 'package:flutter_rust/router/routes.dart';

class Routes {
  static Route home = Route(name: 'home', path: '/');
  static TitleRoute books = TitleRoute(name: 'books', path: '/books', title: 'All Books');
  static TitleRoute addBook = TitleRoute(name: 'add-book', path: '/add-book', title: 'Add Book');
  static TitleRoute settings = TitleRoute(name: 'settings', path: '/settings', title: 'Settings');
}
