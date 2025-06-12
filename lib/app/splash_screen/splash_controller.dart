import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashCompleted extends SplashState {}

class SplashError extends SplashState {
  final String? message;
  SplashError(this.message);
}

class SplashController extends StateNotifier<SplashState> {
  SplashController() : super(SplashInitial());

  void startSplash() async {
    state = SplashLoading();
    await Future.delayed(Duration(seconds: 2));

    state = SplashCompleted();
  }
}

final splashControllerProvider = StateNotifierProvider<SplashController,SplashState>(
    (ref) => SplashController()..startSplash());