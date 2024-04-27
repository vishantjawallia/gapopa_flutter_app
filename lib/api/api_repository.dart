import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// final dio = Dio();

class ApiRepository {
  static Future<http.Response> get(
    String url, {
    String? token,
  }) async {
    final response = await http.get(Uri.parse(url));
    log(url.toString());
    return response;
  }

  // static Future<Response> post(
  //   String url, {
  //   String? token,
  //   Map<String, dynamic>? data,
  // }) async {
  //   final response = await dio.post(
  //     data: jsonEncode(data),
  //     'https://api.example.com/user',
  //   );
  //   return response;
  // }
}
