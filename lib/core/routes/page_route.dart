import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/app/app.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => Onboarding()),
    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUp()),
    GoRoute(path: '/otpScreen', builder: (context, state) => OtpScreen()),
    GoRoute(path: '/home', builder: (context, state) => Home()),
  ],
);
