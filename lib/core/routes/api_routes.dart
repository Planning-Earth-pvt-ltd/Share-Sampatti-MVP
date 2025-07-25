class ApiRoutes {
  static const String baseUrl = 'http://13.221.144.207:4000/api/v1';
  static const String sendOTP = '$baseUrl/user/sendOTP';
  static const String verifyOtp = '$baseUrl/user/verifyOTP';
  static const String property = '$baseUrl/progress/property_home';
  static const String currentProperty = '$baseUrl/property/GET_PROPERTY';
  static const String createOrder = '$baseUrl/transactions/create';
  static const String verifyOrder = '$baseUrl/transactions/verify';
  static const String filterByState = '$baseUrl/property/state/';

  static final String getTransactions = '$baseUrl/transactions/user';
}
