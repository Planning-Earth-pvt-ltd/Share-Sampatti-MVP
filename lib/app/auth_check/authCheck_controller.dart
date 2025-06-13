//AuthCheck State
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/app/app.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(),
);

class AuthState {
  final bool isFirstInstall;
  final bool isLoggedIn;

  AuthState({required this.isFirstInstall, required this.isLoggedIn});
}

class AuthController extends StateNotifier<AuthState> {
  AuthController()
    : super(
        AuthState(
          isFirstInstall: AuthPreference.isFirstInstall(),
          isLoggedIn: AuthPreference.isUserLoggedIn(),
        ),
      );

  void checkAuthStatus() {
    if (state.isFirstInstall) {
      AuthPreference.setFirstInstall();
    }
    state = AuthState(
      isFirstInstall: false,
      isLoggedIn: AuthPreference.isUserLoggedIn(),
    );
  }
}
