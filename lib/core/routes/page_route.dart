import 'package:share_sampatti_mvp/app/app.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => Onboarding()),
    GoRoute(path: '/login', builder: (context, state) => LogInScreen()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: '/otpScreen',
      builder: (context, state) => OtpVerificationScreen(),
    ),

    // NAVIGATION
    GoRoute(
      path: '/navigation',
      builder: (context, state) => NavigationScreen(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    GoRoute(path: '/investNow', builder: (context, state) => InvestNowScreen()),

    // USER PROFILE
    GoRoute(
      path: '/personalDetails',
      builder: (context, state) => CompleteYourProfileScreen(),
    ),
    GoRoute(path: '/kyc', builder: (context, state) => KYCScreen()),

    // KYC
    GoRoute(path: '/pan', builder: (context, state) => PanScreen()),
    GoRoute(path: '/addhar', builder: (context, state) => AddharScreen()),

    // BANK DETAILS
    GoRoute(
      path: '/bankDetails',
      builder: (context, state) => BankDetailsScreen(),
    ),
    GoRoute(
      path: '/enterBankDetails',
      builder: (context, state) => EnterBankDetailsScreen(),
    ),

    GoRoute(path: '/aboutUs', builder: (context, state) => AboutUsScreen()),
    GoRoute(
      path: '/termsAndConditions',
      builder: (context, state) => TermsAndConditionsScreen(),
    ),
    GoRoute(
      path: '/privacyPolicy',
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
    GoRoute(path: '/faq', builder: (context, state) => FAQScreen()),
  ],
);
