import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/core/services/auth_service.dart';
import 'package:share_sampatti_mvp/scr/features/providers/auth_provider.dart';

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
  AuthController(this._authService)
    : super(
        AuthState(
          isFirstInstall: AuthPreference.isFirstInstall(),
          isLoggedIn: AuthPreference.isUserLoggedIn(),
        ),
      );

  void setAuthMode(AuthMode mode) {
    _mode = mode;
  }

  //CheckAuth Status
  void checkAuthStatus() async {
    final isFirstInstall = AuthPreference.isFirstInstall();
    final isLoggedIn = AuthPreference.isUserLoggedIn();

    if (isFirstInstall) {
      AuthPreference.setFirstInstall();
    }
    state = state.copyWith(
      isFirstInstall: isFirstInstall,
      isLoggedIn: isLoggedIn,
    );
  }

  //sendOtp
  Future<bool> sendOtp({required String phone, String? name}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final  message = await _authService.sendOtp(
        phone: phone,
        name: _mode == AuthMode.signup ? name : null,
      );
      print("✅ Message received: $message (${message.runtimeType})");
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
      state = state.copyWith(isLoggedIn: true);
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

final provider = Provider.autoDispose<Map<String, TextEditingController>>((ref) {
  final controller = {
    "name": TextEditingController(),
    "mobileNumber": TextEditingController(),
  };
  ref.onDispose(() {
    for (final c in controller.values) {
      c.dispose();
    }
  });
  return controller;
});

final nameValidatorProvider = Provider<String? Function(String?)?>((ref) {
  final RegExp nameRegex = RegExp(r'^[A-Za-z]{2,}(?:\s+[A-Za-z]+){0,2}$');
  return (String? name) {
    final trimmedName = name?.trim();
    if (trimmedName == null || trimmedName.isEmpty) {
      return "Please enter your name";
    } else if (trimmedName.length < 2) {
      return "Name must be at least 2 characters";
    } else if (!nameRegex.hasMatch(trimmedName)) {
      return "Include only alphabets and spaces";
    }
    return null;
  };
});

final mobileValidatorProvider = Provider<String? Function(String?)?>((ref) {
  final RegExp mobileNumberRegex = RegExp(r'^[6-9]\d{9}$');
  return (String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return "Please enter mobile number";
    }
    if (!mobileNumberRegex.hasMatch(mobileNumber)) {
      return "Enter a valid 10-digit mobile number";
    }
    return null;
  };
});

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


