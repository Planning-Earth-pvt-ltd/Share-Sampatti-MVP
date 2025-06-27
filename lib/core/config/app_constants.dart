class AppConstants {
  // ABOUT APPS
  static const String appName = "Share Sampatti";
  static const double appVersion = 1.0;
  static const String aboutApp = "Share your Sampatti";
  static const String supportEmail = "";
  static const String supportPhone = "";

  //FONTS
  static const String interFontFamily = "Inter";

  // REGEX
  static RegExp nameRegex = RegExp(r'^[A-Za-z]{2,}(?:\s+[A-Za-z]+){0,2}$');
  static RegExp mobileNumberRegex = RegExp(r'^[6-9]\d{9}$');
  static RegExp emailRegex = RegExp(r'^[\w-\.]+@gmail\.com$');

  // ONBOARDING TEXT
  static const List<List<String>> title = [
    ["Your Gateway to \n Smart ", "Real Estate Investment"],
    ["Own Property Starting \n At Just \n", "₹2000"],
    ["Smart Moves \n", "Rising Results"],
  ];

  // Home Regions
  static const List<String> regions = [
    "Mohali",
    "Gujarat",
    "Himachal",
    "Chandigarh",
  ];

  // Home Themes
  static const List<String> themes = [
    "Residential",
    "Commercial",
    "Holiday\nHomes",
  ];

  // Profile account details
  static const List<String> accountDetails = ["KYC's", "Bank Details"];

  // Profile about details routes
  static const List<String> accountDetailsRoutes = ["/kyc", "/bankDetails"];

  // Bank Details
  static const List<String> bankDetails = ["Current", "Savings"];

  // Profile about
  static const List<String> about = [
    "About Us",
    "Terms and Conditions",
    "Privacy Policy",
    "FAQ's",
  ];

  // Profile about routes
  static const List<String> aboutRoutes = [
    "/aboutUs",
    "/termsAndConditions",
    "/privacyPolicy",
    "/faq",
  ];

  // About us T&C
  static const List<String> aboutUsItem = [
    "Read Usage Terms & Conditions",
    "Read Privacy Policy",
  ];
}
