// PACKAGE
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/app/splash_screen/splash_controller.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async{
      await Future.delayed(const Duration(seconds: 2));
      await ref.read(authProvider.notifier).checkAuthStatus();
      ref.read(splashControllerProvider.notifier).startSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appDimens = ref.watch(appDimensionsProvider);

    ref.listen(splashControllerProvider, (_, state) {
      final auth = ref.watch(authProvider);
      print("Auth isLogIn:- ${auth.isLoading}");
      if (state is SplashCompleted) {
        if (auth.isFirstInstall) {
          context.go('/onboarding');
        } else if (auth.isLoggedIn) {
          context.go('/navigation');
        } else {
          context.go('/login');
        }
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.splashLogo, width: 400, height: 400),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: appDimens.fontLarge(context),
                  fontWeight: FontWeight.w600,
                  fontFamily: AppConstants.interFontFamily,
                ),
                children: [
                  TextSpan(
                    text: 'Share ',
                    style: TextStyle(color: AppColors.lightGreen),
                  ),
                  TextSpan(
                    text: 'Sampatti',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
