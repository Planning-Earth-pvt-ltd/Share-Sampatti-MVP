import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/scr/features/onboarding/screens/onboarding.dart';

final route = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => Onboarding())],
);
