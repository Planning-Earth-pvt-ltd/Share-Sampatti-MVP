import 'dart:async';
import 'dart:developer';
import 'package:share_sampatti_mvp/app/app.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<OnboardingScreen> {
  Timer? _timer;
  bool hasPrecache = true;

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  _autoScroll() {
    _timer = Timer.periodic(Duration(seconds: 6), (_) {
      final pageController = ref.read(pageProvider);
      final currentPage = ref.read(currentPageProvider);

      log(currentPage.toString());
      if (currentPage < AppConstants.title.length - 1) {
        pageController.animateToPage(
          currentPage + 1,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        ref.read(currentPageProvider.notifier).state++;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appDimensions = ref.watch(appDimensionsProvider);
    final pageController = ref.watch(pageProvider);
    final currentPage =
        ref.watch(currentPageProvider) < AppConstants.title.length - 1;

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: AppConstants.title.length,
        onPageChanged: (index) =>
            ref.read(currentPageProvider.notifier).state = index,
        itemBuilder: (context, index) =>
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TITLE
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: AppConstants.interFontFamily,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: appDimensions.fontXL,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: AppConstants.title[index][0]),
                      TextSpan(
                        text: AppConstants.title[index][1],
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),

                // IMAGE
                Expanded(child: Image.asset(AppAssets.onboardingImages[index])),
                SizedBox(height: appDimensions.verticalSpaceXS),
              ],
            ).withPadAllCustom(
              appDimensions.verticalSpaceL,
              0,
              appDimensions.horizontalSpaceM,
              appDimensions.horizontalSpaceM,
            ),
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // INDICATOR
          SmoothPageIndicator(
            controller: pageController,
            count: AppConstants.title.length,
            effect: SlideEffect(
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotColor: Theme.of(context).colorScheme.primary.withAlpha(100),
              dotHeight: 10,
              dotWidth: 10,
            ),
          ),
          SizedBox(height: appDimensions.verticalSpaceS),

          // GET STARTED BUTTON
          CustomElevatedButton(
            onPressed: () {
              if (currentPage) {
                pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                ref.read(currentPageProvider.notifier).state++;
              } else {
                context.push("/login");
              }
            },
            text: currentPage ? "Next" : "Get Started",
          ).withPadHorizontal(appDimensions.horizontalSpaceM),
        ],
      ).withPadCustom(EdgeInsets.only(bottom: appDimensions.verticalSpaceM)),
    );
  }
}
