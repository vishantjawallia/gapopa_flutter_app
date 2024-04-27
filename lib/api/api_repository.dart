// ignore_for_file: depend_on_referenced_packages

import "package:http/http.dart" as http;

class ApiRepository {
  static Future<http.Response> get(
    String url, {
    String? token,
  }) async {
    final response = await http.get(Uri.parse(url));
    return response;
  }
}
