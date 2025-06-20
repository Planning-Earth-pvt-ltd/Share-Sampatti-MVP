import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/model/user_model.dart';

import 'base_services.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  final BaseService _baseService = BaseService();

  //Send Otp(SignUp and LogIn)
  Future<String> sendOtp({String? name, required String phone}) async {
    print('SendOtp');
    final body = {'phoneNumber': phone, if (name != null) 'name': name};
    print("Phone:- $phone");
    print(ApiRoutes.sendOtp);
    final response = await _baseService.post(ApiRoutes.sendOtp, body);
    dynamic rawData = response.data;
    print("Raw Response Data: $rawData (${rawData.runtimeType})");
    // ✅ Step 1: Ensure JSON decoded
    late final Map<String, dynamic> data;
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

    // ✅ Step 2: Safely access message
    final message = data['message'];
    if (message is String) {
      print("OTP Message: $message");
      return message;
    } else {
      throw Exception("Missing or invalid 'message' in response");
    }
  }

  //Verify OTP and Save Tokens
  Future<UserModel> verifyOtp({
    String? name,
    required String phone,
    required String otp,
  }) async {
    final body = {
      'phoneNumber': phone,
      'otp': otp,
      if (name != null) 'name': name,
    };
    final response = await _baseService.post(ApiRoutes.verifyOtp, body);
    final data = response.data;
    await AuthPreference.saveUserData(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
      user: Map<String, dynamic>.from(data['user']),
    );
    return UserModel.fromJson(response.data['user']);
  }
}
