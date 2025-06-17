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
      final response = await _dio.post(url, data: body);
      print("API Response: ${response.statusCode} => ${response.data}");
      return response;
    } on DioException catch (e,stack) {
      print("❌ DioException: ${e.message}");
      print("❌ Full Stack Trace:\n$stack");
      dynamic errorData = e.response?.data;
      String message;

      if (errorData is Map<String, dynamic> && errorData['message'] != null) {
        message = errorData['message'].toString();
      } else if (errorData is String) {
        message = errorData;
      } else {
        message = 'Something went wrong';
      }
      print("❌ DioException: ${e.message}");
      print("❌ DioError Type: ${e.type}");
      print("❌ DioError Response: ${e.response}");

      throw Exception(message);
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
