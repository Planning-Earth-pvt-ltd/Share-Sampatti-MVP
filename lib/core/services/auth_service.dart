import 'dart:convert';
import 'dart:developer';

import 'package:share_sampatti_mvp/app/app.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  final BaseService _baseService = BaseService();

  // MARK: SEND OTP
  // (SIGN UP AND LOG IN)
  Future<String?> sendOtp({
    required String phone,
    required String type,
    String? name,
  }) async {
    log('[AuthService] sendOtp called');
    final data = {
      'phoneNumber': phone,
      if (name != null) 'fullName': name,
      'type': type,
    };

    // RESPONSE
    final response = await _baseService.post(ApiRoutes.sendOTP, data);

    final rawData = _handleResponseData(response.data);
    log("[Send OTP] Response Data: $rawData");

    final message = rawData['message'];
    if (message is String) {
      return message;
    } else {
      throw Exception("Missing or invalid 'message' in response");
    }
  }

  // MARK: VERIFY OTP
  // (OTP SCREEN AND SAVE TOKEN)
  Future<String?> verifyOtp({
    required String phone,
    required String type,
    required String otp,
    String? name,
  }) async {
    log('[AuthService] verifyOtp called');
    final data = {
      'phoneNumber': phone,
      'OTP': otp,
      if (name != null) 'fullName': name,
      'type': type,
    };

    // RESPONSE
    final response = await _baseService.post(ApiRoutes.verifyOtp, data);

    final rawData = _handleResponseData(response.data);
    log("[Verify OTP] Response Data: $rawData");

    try {
      await AuthPreference.saveUserData(
        accessToken: rawData['accessToken'],
        refreshToken: rawData['refreshToken'],
        user: Map<String, dynamic>.from(rawData['user']),
      );
      log("[AuthService] User data saved");
      return null;
    } catch (e) {
      log("[AuthService] Exception saving user data: $e");
      throw Exception("Failed to save user data");
    }
  }

  Map<String, dynamic> _handleResponseData(dynamic rawData) {
    if (rawData is Map<String, dynamic>) {
      return rawData;
    } else if (rawData is String) {
      try {
        return jsonDecode(rawData) as Map<String, dynamic>;
      } catch (e) {
        log("[AuthService] JSON Decode Failed: $e");
        throw Exception("JSON Decode Failed: $e");
      }
    } else {
      log("[AuthService] Unexpected response type: ${rawData.runtimeType}");
      throw Exception("Unexpected response type: ${rawData.runtimeType}");
    }
  }
}
