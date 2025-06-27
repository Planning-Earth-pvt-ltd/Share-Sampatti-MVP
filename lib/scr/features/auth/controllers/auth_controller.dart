import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/core/services/auth_service.dart';

import '../../../../app/app.dart';
import '../../../../app/auth_check/auth_preferences.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref.read(authServiceProvider)),
);

class AuthState {
  final bool isFirstInstall;
  final bool isLoggedIn;
  final bool isLoading;
  final String? error;

  AuthState({
    this.isFirstInstall = true,
    this.isLoggedIn = false,
    this.isLoading = false,
    this.error,
  });

  factory AuthState.initial() => AuthState();

  AuthState copyWith({
    bool? isFirstInstall,
    bool? isLoggedIn,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isFirstInstall: isFirstInstall ?? this.isFirstInstall,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

enum AuthMode { login, signup }

class AuthController extends StateNotifier<AuthState> {
  final AuthService _authService;
  AuthMode _mode = AuthMode.signup;
  AuthController(this._authService) : super(AuthState.initial());

  void setAuthMode(AuthMode mode) {
    _mode = mode;
  }

  //CheckAuth Status
  Future<void> checkAuthStatus() async {
    if (!Hive.isBoxOpen('authBox')) {
      await Hive.openBox('authBox');
    }
    final isFirstInstall = AuthPreference.isFirstInstall();
    final isLoggedIn = AuthPreference.isUserLoggedIn();

    if (isFirstInstall) {
      AuthPreference.setFirstInstall();
    }
    state = state.copyWith(
      isFirstInstall: isFirstInstall,
      isLoggedIn: isLoggedIn,
    );
    print(
      "Hive status — isLoggedIn:([${Hive.isBoxOpen('isLoggedIn')}])  ${Hive.box('authBox').isOpen} $isLoggedIn, isFirstInstall: $isFirstInstall",
    );
    var _box = Hive.box('authBox');
    print("isLoggedIn: ${_box.get('isLoggedIn')}");
    print('Login status: ${_box.get('isLoggedIn')}'); // must print true
  }

  //sendOtp
  Future<bool> sendOtp({required String phone, String? name}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      print("Before call sendOtp on AuthController");
      final message = await _authService.sendOtp(
        phone: phone,
        name: _mode == AuthMode.signup ? name : null,
      );
      print("After call sendOtp on AuthController");
      print("Message received: $message (${message.runtimeType})");
      return true;
    } catch (error) {
      print('Send Otp error: $error');
      state = state.copyWith(error: error.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //verifyOtp

  Future<void> verifyOtp({
    required String phone,
    required String otp,
    String? name,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _authService.verifyOtp(
        phone: phone,
        otp: otp,
        name: _mode == AuthMode.signup ? name : null,
      );
      await checkAuthStatus();
    } catch (error) {
      state = state.copyWith(error: error.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //Logout
  Future<void> logout() async {
    await AuthPreference.logout();
    state = state.copyWith(isLoggedIn: false);
  }
}

final otpTimerProvider = StateNotifierProvider<OtpTimerController, int>(
  (ref) => OtpTimerController(),
);

class OtpTimerController extends StateNotifier<int> {
  Timer? _timer;

  OtpTimerController() : super(30) {
    start();
  }

  void start() {
    _timer?.cancel();
    state = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
