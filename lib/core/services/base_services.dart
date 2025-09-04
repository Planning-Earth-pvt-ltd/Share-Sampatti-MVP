import 'dart:developer';
import 'package:share_sampatti_mvp/app/app.dart';

class BaseService {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  // GET
  Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    try {
      log("[GET] Url: $url, Query: $query");
      final response = await _dio.get(url, queryParameters: query);
      log("GET API Response: ${response.statusCode} => ${response.data}");
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  // POST
  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      log("[POST] Url: $url");
      final response = await _dio.post(url, data: data);
      log("POST API Response: ${response.statusCode} => ${response.data}");
      return response;
    } on DioException catch (error) {
      throw _handleDioError(error);
    }
  }

  // HANDLE ERROR
  Exception _handleDioError(DioException e) {
    final errorData = e.response?.data;
    String message = "Something went wrong";

    if (errorData is Map<String, dynamic> && errorData["message"] != null) {
      message = errorData["message"].toString();
    } else if (errorData is String) {
      message = errorData;
    }

    return Exception(message);
  }
}
