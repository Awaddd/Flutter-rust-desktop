// ignore_for_file: avoid_classes_with_only_static_members
import 'dart:convert';

import 'package:http/http.dart' as http;

typedef Paths = ({
  Request getBooks,
  Request postBook,
  Request deleteBook,
});

enum Method { get, post, delete }

class Client<T> {
  static String api = "http://localhost:8080";

  static Paths paths = (
    getBooks: Request(path: "books", method: Method.get),
    postBook: Request(path: "book", method: Method.post),
    deleteBook: Request(path: "book/delete", method: Method.delete),
  );

  static Future<http.Response> get(Request request) async {
    final url = Uri.parse("$api/${request.path}");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw ClientException(
        statusCode: response.statusCode,
        response: response,
      );
    }

    return response;
  }

  static Future<http.Response> post(Request request, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse("$api/${request.path}"),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(body),
    );

    if (response.statusCode != 200) {
      throw ClientException(
        statusCode: response.statusCode,
        response: response,
      );
    }

    return response;
  }

  static Future<http.Response> delete(Request request, String id) async {
    final response = await http.delete(
      Uri.parse("$api/${request.path}/$id"),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode != 200) {
      throw ClientException(
        statusCode: response.statusCode,
        response: response,
      );
    }

    return response;
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

class GenericException implements Exception {
  GenericException(this.error);

  String error;

  @override
  String toString() => error;
}
