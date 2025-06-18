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
    GoRoute(
      path: '/navigation',
      builder: (context, state) => NavigationScreen(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
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
    GoRoute(path: '/investNow', builder: (context, state) => InvestNowScreen()),
  ],
);
