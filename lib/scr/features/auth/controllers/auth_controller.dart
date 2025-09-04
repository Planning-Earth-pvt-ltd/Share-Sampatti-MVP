import 'dart:async';
import 'dart:developer';
import 'package:share_sampatti_mvp/app/app.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref.read(authServiceProvider)),
);

class AuthState {
  final bool isFirstInstall;
  final bool isLoggedIn;
  final bool isLoading;
  final String? error;

  AuthState({
    this.isFirstInstall = true,
    this.isLoggedIn = false,
    this.isLoading = false,
    this.error,
  });

  factory AuthState.initial() => AuthState();

  AuthState copyWith({
    bool? isFirstInstall,
    bool? isLoggedIn,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isFirstInstall: isFirstInstall ?? this.isFirstInstall,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

enum AuthMode { login, signup }

class AuthController extends StateNotifier<AuthState> {
  final AuthService _authService;
  AuthMode _mode = AuthMode.signup;
  AuthController(this._authService) : super(AuthState.initial());

  void setAuthMode(AuthMode mode) {
    _mode = mode;
  }

  //CheckAuth Status
  Future<void> checkAuthStatus() async {
    if (!Hive.isBoxOpen('authBox')) {
      await Hive.openBox('authBox');
    }
    final isFirstInstall = AuthPreference.isFirstInstall();
    final isLoggedIn = AuthPreference.isUserLoggedIn();

    if (isFirstInstall) {
      AuthPreference.setFirstInstall();
    }
    state = state.copyWith(
      isFirstInstall: isFirstInstall,
      isLoggedIn: isLoggedIn,
    );
    log(
      "Hive status — isLoggedIn:([${Hive.isBoxOpen('isLoggedIn')}])  ${Hive.box('authBox').isOpen} $isLoggedIn, isFirstInstall: $isFirstInstall",
    );
    var box = Hive.box('authBox');
    log("isLoggedIn: ${box.get('isLoggedIn')}");
    log('Login status: ${box.get('isLoggedIn')}'); // must print true
  }

  //sendOtp
  Future<bool> sendOtp({required String phone, String? name}) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      log("Before call sendOtp on AuthController - $phone $name $_mode");
      final message = await _authService.sendOtp(
        phone: phone,
        name: _mode == AuthMode.signup ? name : null,
        type: _mode == AuthMode.signup ? "signup" : "login",
      );
      log("After call sendOtp on AuthController");
      log("Message received: $message (${message.runtimeType})");
      return true;
    } catch (error) {
      log('Send Otp error: $error');
      state = state.copyWith(error: error.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //verifyOtp
  Future<bool> verifyOtp({
    required String phone,
    required String otp,
    String? name,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      log("Before call sendOtp on AuthController - $phone $name $_mode");
      final message = await _authService.verifyOtp(
        phone: phone,
        otp: otp,
        name: _mode == AuthMode.signup ? name : null,
        type: _mode == AuthMode.signup ? "signup" : "login",
      );
      log("After call sendOtp on AuthController");
      // if (message == "") {
      //   await checkAuthStatus();
      //   return true;
      // }
      state = state.copyWith(error: message);
      return true;
    } catch (error) {
      state = state.copyWith(error: error.toString());
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  //Logout
  Future<void> logout() async {
    await AuthPreference.logout();
    state = state.copyWith(isLoggedIn: false);
  }
}

final otpTimerProvider = StateNotifierProvider<OtpTimerController, int>(
  (ref) => OtpTimerController(),
);

class OtpTimerController extends StateNotifier<int> {
  Timer? _timer;

  OtpTimerController() : super(30) {
    start();
  }

  void start() {
    _timer?.cancel();
    state = 59;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        state--;
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
