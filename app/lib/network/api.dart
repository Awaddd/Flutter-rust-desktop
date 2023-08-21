// ignore_for_file: avoid_classes_with_only_static_members
import 'package:http/http.dart' as http;

typedef Paths = ({
  Request getBooks,
  Request postBook,
});

enum Method { get, post }

class Client<T> {
  static String api = "http://localhost:8080";

  static Paths paths = (
    getBooks: Request(path: "books", method: Method.get),
    postBook: Request(path: "book", method: Method.post),
  );

  static Future<http.Response> get(Request request) async {
    final url = Uri.parse("$api/${request.path}");
    return http.get(url);
  }
}

class Request {
  Request({
    required this.path,
    required Method method,
  }) : _method = method;

  final String path;
  final Method _method;

  @override
  String toString() => "Path=$path; Method=${_method.name}";
}
