import 'package:share_sampatti_mvp/app/app.dart';

String? _trimmedValue(String? value) =>
    value?.trim().isEmpty ?? true ? null : value!.trim();

final nameValidatorProvider = Provider<String? Function(String?)?>((ref) {
  return (String? name) {
    final trimmedName = _trimmedValue(name);
    if (trimmedName == null) {
      return "Please enter your name";
    } else if (trimmedName.length < 2) {
      return "Name must be at least 2 characters";
    } else if (!AppConstants.nameRegex.hasMatch(trimmedName)) {
      return "Include only alphabets and spaces";
    }
    return null;
  };
});

final mobileValidatorProvider = Provider<String? Function(String?)?>((ref) {
  return (String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.isEmpty) {
      return "Please enter a mobile number";
    }
    if (!AppConstants.mobileNumberRegex.hasMatch(mobileNumber)) {
      return "Enter a valid 10-digit mobile number";
    }
    return null;
  };
});

final emailValidatorProvider = Provider<String? Function(String?)?>((ref) {
  return (String? email) {
    final trimmedEmail = _trimmedValue(email);
    if (trimmedEmail == null) {
      return "Please enter your email address";
    } else if (!AppConstants.emailRegex.hasMatch(trimmedEmail)) {
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
