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

      throw Exception(errorData);
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

// class BaseService {
//   final Dio _dio;

//   BaseService()
//     : _dio = Dio(
//         BaseOptions(
//           headers: {'Content-Type': 'application/json'},
//           connectTimeout: const Duration(seconds: 20),
//           receiveTimeout: const Duration(seconds: 20),
//         ),
//       );

//   // REQUEST FOR GET, POST, DELETE, PUT
//   Future<Response> _request({
//     required String url,
//     required String method,
//     Map<String, dynamic>? data,
//   }) async {
//     try {
//       log("[$method] Url: $url\nData: $data");
//       final response = await _dio.request(url, data: data);
//       log("API Response: ${response.statusCode} => ${response.data}");
//       return response;
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   // HANDLE ERROR
//   Exception _handleDioError(DioException e) {
//     final errorData = e.response?.data;
//     String message = "Something went wrong";

//     if (errorData is Map<String, dynamic> && errorData["message"] != null) {
//       message = errorData["message"].toString();
//     } else if (errorData is String) {
//       message = errorData;
//     }

//     return Exception(message);
//   }

//   // GET
//   Future<Response> get({required String url}) =>
//       _request(url: url, method: "GET");

//   // POST
//   Future<Response> post({
//     required String url,
//     required Map<String, dynamic>? data,
//   }) => _request(url: url, method: "POST", data: data);
// }
