import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/features/profile/screens/privacy_policy/screens/privacy_policy_screen.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => Onboarding()),
    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUp()),
    GoRoute(path: '/otpScreen', builder: (context, state) => OtpScreen()),
    GoRoute(
      path: '/navigation',
      builder: (context, state) => NavigationScreen(),
    ),
    GoRoute(path: '/profile', builder: (context, state) => Profile()),
    GoRoute(path: '/aboutUs', builder: (context, state) => AboutUs()),
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
