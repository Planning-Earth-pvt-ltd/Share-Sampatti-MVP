class ApiRoutes {
  static const String baseUrl = 'http://192.168.1.4:4000/api/v1';
  static const String sendOTP = '$baseUrl/user/sendOTP';
  static const String verifyOtp = '$baseUrl/user/verifyOTP';
  static const String property = '$baseUrl/property/property_home';
  static const String currentProperty = '$baseUrl/property/GET_PROPERTY';

  // SCREEN ROUTE
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signUp';
}
