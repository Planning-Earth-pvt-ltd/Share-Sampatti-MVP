import 'package:share_sampatti_mvp/app/app.dart';

class Navigate {
  static final route = GoRouter(
    routes: [
      // MARK: STARTING
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => slide(state, LogInScreen()),
      ),
      GoRoute(
        path: '/signUp',
        pageBuilder: (context, state) => slide(state, SignUpScreen()),
      ),
      GoRoute(
        path: '/otpScreen',
        pageBuilder: (context, state) => slide(state, OtpVerificationScreen()),
      ),

      // MARK: NAVIGATION
      GoRoute(
        path: '/navigation',
        pageBuilder: (context, state) => slide(state, NavigationScreen()),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => slide(state, ProfileScreen()),
      ),
      GoRoute(
        path: '/investNow/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;

          return CustomTransitionPage(
            key: state.pageKey,
            child: InvestNowScreen(id: id),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
          );
        },
      ),
      GoRoute(path: '/explore', builder: (context, state) => ExploreScreen()),
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
        path: '/investNowDocument/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;

          return CustomTransitionPage(
            key: state.pageKey,
            child: InvestNowDocument(id: id),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
          );
        },
      ),
    ],
  );

  static Page<dynamic> slide(GoRouterState state, Widget widget) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
    );
  }
}
