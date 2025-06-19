import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum AuthFlow {login,signup}
//
// final authFlowProvider = StateProvider<AuthFlow?> ((ref)=> null);

// final authProvider = StateNotifierProvider<AuthController, AuthState>(
//       (ref) => AuthController(ref.read(authServiceProvider)),
// );
//
// final authServiceProvider = Provider<AuthService>((ref) => AuthService());
//
// class AuthState {
//   final bool isFirstInstall;
//   final bool isLoggedIn;
//   final bool isLoading;
//   final String? error;
//
//   AuthState({
//     this.isFirstInstall = true,
//     this.isLoggedIn = false,
//     this.isLoading = false,
//     this.error,
//   });
//
//   AuthState copyWith({
//     bool? isFirstInstall,
//     bool? isLoggedIn,
//     bool? isLoading,
//     String? error,
//   }) {
//     return AuthState(
//       isFirstInstall: isFirstInstall ?? this.isFirstInstall,
//       isLoggedIn: isLoggedIn ?? this.isLoggedIn,
//       isLoading: isLoading ?? this.isLoading,
//       error: error,
//     );
//   }
// }
//
// class AuthController extends StateNotifier<AuthState> {
//   final AuthService _authService;
//
//   AuthController(this._authService)
//       : super(
//     AuthState(
//       isFirstInstall: AuthPreference.isFirstInstall(),
//       isLoggedIn: AuthPreference.isUserLoggedIn(),
//     ),
//   );
//
//   void checkAuthStatus() {
//     if (state.isFirstInstall) {
//       AuthPreference.setFirstInstall();
//     }
//
//     state = state.copyWith(
//       isFirstInstall: false,
//       isLoggedIn: AuthPreference.isUserLoggedIn(),
//     );
//   }
//
//   Future<void> sendOtp({required String phone, String? name}) async {
//     try {
//       state = state.copyWith(isLoading: true, error: null);
//       await _authService.sendOtp(phone: phone, name: name);
//     } catch (e) {
//       state = state.copyWith(error: e.toString());
//     } finally {
//       state = state.copyWith(isLoading: false);
//     }
//   }
//
//   Future<void> verifyOtp({
//     required String phone,
//     required String otp,
//     String? name,
//   }) async {
//     try {
//       state = state.copyWith(isLoading: true, error: null);
//       final user = await _authService.verifyOtp(
//         phone: phone,
//         otp: otp,
//         name: name,
//       );
//       state = state.copyWith(isLoggedIn: true);
//     } catch (e) {
//       state = state.copyWith(error: e.toString());
//     } finally {
//       state = state.copyWith(isLoading: false);
//     }
//   }
// }
