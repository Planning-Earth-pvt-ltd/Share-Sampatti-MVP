import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/features/chat_bot/screens/chat_bot_screen.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LogInScreen()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: '/otpScreen',
      builder: (context, state) => OtpVerificationScreen(),
    ),

    // MARK: NAVIGATION
    GoRoute(
      path: '/navigation',
      builder: (context, state) => NavigationScreen(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
    GoRoute(path: '/investNow', builder: (context, state) => InvestNowScreen()),
    GoRoute(path: '/chatBot', builder: (context, state) => ChatBotScreen()),

    // MARK: USER PROFILE
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

    // MARK: INVEST NOW
    GoRoute(
      path: '/investNowDocument',
      builder: (context, state) => InvestNowDocument(),
    ),
  ],
);
