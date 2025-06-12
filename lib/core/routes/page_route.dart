import 'package:go_router/go_router.dart';
<<<<<<< Updated upstream
import 'package:share_sampatti_mvp/scr/features/auth/screens/otp_screen.dart';

import 'package:share_sampatti_mvp/scr/src.dart';
=======
import 'package:share_sampatti_mvp/app/app.dart';
>>>>>>> Stashed changes

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
