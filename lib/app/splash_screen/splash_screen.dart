import 'package:share_sampatti_mvp/app/app.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(splashControllerProvider.notifier).startSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appDimens = ref.watch(appDimensionsProvider);

    ref.listen(splashControllerProvider, (_, state) {
      if (state is SplashCompleted) {
        final authState = ref.watch(authProvider);
        if (authState.isFirstInstall) {
          context.pushReplacement('/onboarding');
        } else if (authState.isLoggedIn) {
          context.pushReplacement('/home');
        } else {
          context.pushReplacement('/login');
        }
      } else if (state is SplashError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Inter(text: state.message ?? 'Network Problem')),
        );
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.appLogo, width: 400, height: 400),
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
