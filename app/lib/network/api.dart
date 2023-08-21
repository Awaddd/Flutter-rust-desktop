// ignore_for_file: avoid_classes_with_only_static_members
import 'dart:convert';

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

  static Future<http.Response> post(Request request, Map<String, dynamic> body) async {
    return http.post(
      Uri.parse("$api/${request.path}"),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(body),
    );
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

class ClientException implements Exception {
  ClientException({
    required this.statusCode,
    required this.response,
  });

  final int statusCode;
  final http.Response response;

  @override
  String toString() {
    final errorData = <String, dynamic>{
      "statusCode": statusCode,
      "response": response,
    };

    return "ClientException: $errorData";
  }
}
