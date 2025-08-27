import 'dart:convert';
import 'package:hive_flutter/adapters.dart';

class AuthPreference {
  static late Box _box;
  static Future<void> init() async {
    _box = Hive.box('authBox');
  }

  static bool isFirstInstall() {
    return _box.get('isFirstInstall', defaultValue: true);
  }

  static void setFirstInstall() {
    _box.put('isFirstInstall', false);
  }

  static bool isUserLoggedIn() {
    return _box.get('isLoggedIn', defaultValue: false);
  }

  static void setUserLoggedIn(bool status) {
    _box.put('isLoggedIn', status);
  }

  //Save User Data after Login or SignUp
  static Future<void> saveUserData({
    required String accessToken,
    required String refreshToken,
    required Map<String, dynamic> user,
  }) async {
    print('Save User Data');
    var box = Hive.box('authBox');
    await box.put('accessToken', accessToken);
    await box.put('refreshToken', refreshToken);
    await box.put('user', jsonEncode(user));
    print("[SAVE] Writing isLoggedIn:true");
    await box.put('isLoggedIn', true);
    await box.flush();
    print("[SAVE] Post flush isLoggedIn: ${box.get('isLoggedIn')}");
    print("[SAVE] Post flush accessToken: ${box.get('accessToken')}");
    print("[SAVE] Post flush refreshToken: ${box.get('refreshToken')}");
    print("[SAVE] Post flush user: ${box.get('user')}");
  }

  static String? getAccessToken() => _box.get('accessToken');
  static String? getRefreshToken() => _box.get('refreshToken');

  //Get Data from the hive
  static Map<String, dynamic>? getUserData() {
    final userJson = _box.get('user');
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  //clear all data or LogOut
  static Future<void> logout() async {
    await _box.delete('accessToken');
    await _box.delete('refreshToken');
    await _box.delete('user');
    await _box.put('isLoggedIn', false);
  }
}
