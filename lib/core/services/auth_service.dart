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
    print('sendOtp function call on Auth Service');
    final body = {'phoneNumber': phone, if (name != null) 'name': name};
    print(ApiRoutes.sendOtp);
    final response = await _baseService.post(ApiRoutes.sendOtp, body);
    final rawData = response.data;
    Map<String, dynamic> data = rawData is String
        ? jsonDecode(rawData)
        : Map<String, dynamic>.from(rawData);
    print("RESPONSE:- $response");
    print("Raw Response Data:- $rawData (${rawData.runtimeType})");
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
    final rawData = response.data;
    final Map<String, dynamic> data = rawData is String
        ? jsonDecode(rawData)
        : Map<String, dynamic>.from(rawData);
    print("Response Data: $data");
    try{
      final accessToken = data['accessToken'];
      final refreshToken = data['refreshToken'];
      final user = Map<String, dynamic>.from(data['user']);
      print("[VERIFY] Parsed values:");
      print("AccessToken: $accessToken");
      print("RefreshToken: $refreshToken");
      print("User: $user");
      print("Before AuthPref SaverUserData");
    await AuthPreference.saveUserData(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
      user: Map<String, dynamic>.from(data['user']),
    );
    print("After AuthPref SaverUserData");
    } catch (e,st) {
      print("[VERIFY] Exception saving user data: $e");
      print(st);
    }
    return UserModel.fromJson(response.data['user']);
  }
}
