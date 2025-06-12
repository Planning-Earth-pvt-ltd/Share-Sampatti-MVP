import 'package:go_router/go_router.dart';

import 'package:share_sampatti_mvp/scr/features/home/screens/home.dart';
import 'package:share_sampatti_mvp/scr/features/auth/screens/sign_up.dart';
import 'package:share_sampatti_mvp/scr/features/auth/screens/login_screen.dart';
import 'package:share_sampatti_mvp/scr/features/onboarding/screens/onboarding.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => Onboarding()),
    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUp()),
    GoRoute(path: '/home', builder: (context, state) => Home()),
  ],
);
