import 'dart:developer';

import 'package:dio/dio.dart';

class BaseService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  //Post Call
  Future<Response> post(String url, Map<String, dynamic> body) async {
    try {
      log("Url - $url, body - $body");
      final response = await _dio.post(url, data: body);
      log("API Response: ${response.statusCode} => ${response.data}");
      return response;
    } on DioException catch (e) {
      dynamic errorData = e.response?.data;
      String message;
      if (errorData is Map<String, dynamic> && errorData['message'] != null) {
        message = errorData['message'].toString();
        log("Error on Base server as map - $message");
      } else if (errorData is String) {
        message = errorData;
        log("Error on Base server as String - $message");
      } else {
        message = 'Something went wrong';
      }

      if (e.response == null) {
        throw Exception(errorData);
      } else {
        return e.response!;
      }
    }
  }

  Future<Response> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'] ?? 'Something went wrong',
      );
    }
  }
}
