class ApiRoutes {
  static const String baseUrl = 'http://192.168.1.17:4000/api/v1/user';
  static const String sendOTP = '$baseUrl/sendOTP';
  static const String verifyOtp = '$baseUrl/verifyOTP';

  // SCREEN ROUTE
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signUp';
}
