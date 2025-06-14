import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = Provider.autoDispose<Map<String, TextEditingController>>((
  ref,
) {
  final controller = {
    "name": TextEditingController(),
    "mobileNumber": TextEditingController(),
  };
  ref.onDispose(() {
    for (final controller in controller.values) {
      controller.dispose();
    }
  });
  return controller;
});

final codeProvider = StateProvider<String>((ref) => "");

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

final otpValidatorProvider = Provider<String? Function(String?)?>((ref) {
  final RegExp otpRegex = RegExp(r'^[0-9]+$');

  return (String? otp) {
    if (otp == null || otp.isEmpty) {
      return "Please enter the OTP";
    }
    if (!otpRegex.hasMatch(otp)) {
      return "Enter a valid OTP";
    }
    if (otp != "000000") {
      return "Invalid OTP";
    }
    return null;
  };
});

final otpTimerProvider = StateNotifierProvider<TimeProvider, int>(
  (ref) => TimeProvider(),
);

class TimeProvider extends StateNotifier<int> {
  TimeProvider() : super(30) {
    start();
  }

  start() {
    state = 30;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        timer.cancel();
      }
    });
  }
}
