class Route {
  final String name;
  final String path;

  Route({
    required this.name,
    required this.path,
  });
}

class TitleRoute extends Route {
  final String title;

  TitleRoute({
    required super.name,
    required super.path,
    required this.title,
  });
}
