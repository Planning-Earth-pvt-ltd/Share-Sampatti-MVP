import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/features/navigation/screens/portfolio/screens/transactions/screens/transactions_details_screen.dart';

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
      GoRoute(
        path: '/paymentConfirmation/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;

          return CustomTransitionPage(
            key: state.pageKey,
            child: PaymentConfirmationScreen(id: id),
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
      GoRoute(
        path: '/explore',
        pageBuilder: (context, state) => slide(state, ExploreScreen()),
      ),
      GoRoute(
        path: '/chatBot',
        pageBuilder: (context, state) => slide(state, ChatBotScreen()),
      ),

      // MARK: USER PROFILE
      GoRoute(
        path: '/personalDetails',
        pageBuilder: (context, state) =>
            slide(state, CompleteYourProfileScreen()),
      ),
      GoRoute(
        path: '/kyc',
        pageBuilder: (context, state) => slide(state, KYCScreen()),
      ),

      // KYC
      GoRoute(
        path: '/pan',
        pageBuilder: (context, state) => slide(state, PanScreen()),
      ),
      GoRoute(
        path: '/addhar',
        pageBuilder: (context, state) => slide(state, AddharScreen()),
      ),

      // BANK DETAILS
      GoRoute(
        path: '/bankDetails',
        pageBuilder: (context, state) => slide(state, BankDetailsScreen()),
      ),
      GoRoute(
        path: '/enterBankDetails',
        pageBuilder: (context, state) => slide(state, EnterBankDetailsScreen()),
      ),

      GoRoute(
        path: '/aboutUs',
        pageBuilder: (context, state) => slide(state, AboutUsScreen()),
      ),
      GoRoute(
        path: '/termsAndConditions',
        pageBuilder: (context, state) =>
            slide(state, TermsAndConditionsScreen()),
      ),
      GoRoute(
        path: '/privacyPolicy',
        pageBuilder: (context, state) => slide(state, PrivacyPolicyScreen()),
      ),
      GoRoute(
        path: '/faq',
        pageBuilder: (context, state) => slide(state, FAQScreen()),
      ),
      GoRoute(
        path: '/transactions',
        pageBuilder: (context, state) => slide(state, TransactionsScreen()),
      ),
      GoRoute(
        path: '/transactionsDetails',
        pageBuilder: (context, state) =>
            slide(state, TransactionsDetailsScreen()),
      ),

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
