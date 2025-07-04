import 'dart:convert';
import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/model/user_model.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  final BaseService _baseService = BaseService();

  //Send Otp(SignUp and LogIn)
  Future<String?> sendOtp({
    String? name,
    required String phone,
    required String type,
  }) async {
    log('sendOtp function call on Auth Service');
    final body = {
      'phoneNumber': phone,
      if (name != null) 'fullName': name,
      'type': type,
    };
    final response = await _baseService.post(ApiRoutes.sendOTP, body);
    if (response.statusCode == 200) {
      final rawData = response.data;
      Map<String, dynamic> data = rawData is String
          ? jsonDecode(rawData)
          : Map<String, dynamic>.from(rawData);
      log("RESPONSE:- $response");
      log("Raw Response Data:- $rawData (${rawData.runtimeType})");
      if (rawData is String) {
        try {
          data = jsonDecode(rawData);
        } catch (e) {
          throw Exception("JSON Decode Failed: $e");
        }
      } else if (rawData is Map<String, dynamic>) {
        data = rawData;
      } else {
        throw Exception("Unexpected response type: ${rawData.runtimeType}");
      }
      final message = data['message'];
      if (message is String) {
        log("OTP Message: $message");
        return message;
      } else {
        throw Exception("Missing or invalid 'message' in response");
      }
    }

    return response.data["message"];
  }

  //Verify OTP and Save Tokens
  Future<String?> verifyOtp({
    String? name,
    required String phone,
    required String otp,
    required String type,
  }) async {
    final body = {
      'phoneNumber': phone,
      'OTP': otp,
      if (name != null) 'fullName': name,
      'type': type,
    };
    final response = await _baseService.post(ApiRoutes.verifyOtp, body);
    if (response.statusCode == 200) {
      final rawData = response.data;
      final Map<String, dynamic> data = rawData is String
          ? jsonDecode(rawData)
          : Map<String, dynamic>.from(rawData);
      log("Response Data: $data");
      try {
        final accessToken = data['accessToken'];
        final refreshToken = data['refreshToken'];
        final user = Map<String, dynamic>.from(data['user']);
        log("[VERIFY] Parsed values:");
        log("AccessToken: $accessToken");
        log("RefreshToken: $refreshToken");
        log("User: $user");
        log("Before AuthPref SaverUserData");
        await AuthPreference.saveUserData(
          accessToken: data['accessToken'],
          refreshToken: data['refreshToken'],
          user: Map<String, dynamic>.from(data['user']),
        );
        log("After AuthPref SaverUserData");
      } catch (e, st) {
        log("[VERIFY] Exception saving user data: $e");
        print(st);
      }
      UserModel.fromJson(response.data['user']);
      return null;
    }

    return response.data["message"];
  }
}
