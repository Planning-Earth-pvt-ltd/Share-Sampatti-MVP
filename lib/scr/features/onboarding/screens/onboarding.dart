// PACKAGE
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// RIVERPOD
import 'package:share_sampatti_mvp/scr/features/onboarding/controllers/onboarding_controller.dart';

// COMPONENTS
import 'package:share_sampatti_mvp/common/custom_widgets/custom_buttons/custom_base_button.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class Onboarding extends ConsumerWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageProvider);

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: AppConstants.title.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TITLE
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 36,
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
              Expanded(child: Image.asset(AppAssets.images[index])),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // INDICATOR
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: SlideEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).colorScheme.primary.withAlpha(100),
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            SizedBox(height: 20),

            // GET STARTED BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomElevatedButton(
                onPressed: () => context.push("/signUp"),
                text: "Get Started",
                textColor: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
