import 'package:go_router/go_router.dart';

import 'package:share_sampatti_mvp/scr/src.dart';

final route = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => Onboarding()),
    GoRoute(path: '/login', builder: (context, state) => Login()),
    GoRoute(path: '/signUp', builder: (context, state) => SignUp()),
    GoRoute(path: '/home', builder: (context, state) => Home()),
  ],
);
