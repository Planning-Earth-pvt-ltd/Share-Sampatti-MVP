import 'package:share_sampatti_mvp/app/app.dart';

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
      return "Please enter a mobile number";
    }
    if (!mobileNumberRegex.hasMatch(mobileNumber)) {
      return "Enter a valid 10-digit mobile number";
    }
    return null;
  };
});

final emailValidatorProvider = Provider<String? Function(String?)?>((ref) {
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');
  return (String? email) {
    final trimmedEmail = email?.trim();
    if (trimmedEmail == null || trimmedEmail.isEmpty) {
      return "Please enter your email address";
    } else if (!emailRegex.hasMatch(trimmedEmail)) {
      return "Enter a valid email address (must end with @gmail.com)";
    }
    return null;
  };
});

// PAN VALIDATOR
// ADDHAR VALIDATOR
// ACCOUNT NUMBER VALIDATOR
// ACCOUNT NUMBER VALIDATOR
// IFSC CODE VALIDATOR
// ACCOUNT TYPE VALIDATOR
