// PACKAGE
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// RIVERPOD
import 'package:share_sampatti_mvp/scr/features/onboarding/onboarding.dart';

// COMPONENTS
import 'package:share_sampatti_mvp/common/common.dart';
import 'package:share_sampatti_mvp/core/core.dart';

class Onboarding extends ConsumerWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageProvider);
    final nextIndex =
        ref.watch(currentIndexProvider) < AppConstants.title.length - 1;

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: AppConstants.title.length,
        onPageChanged: (index) =>
            ref.read(currentIndexProvider.notifier).state = index,
        itemBuilder: (context, index) => Column(
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
        ).withPadAllCustom(70, 0, 20, 20),
      ),

      bottomNavigationBar: Column(
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
          CustomElevatedButton(
            onPressed: () {
              if (nextIndex) {
                pageController.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                ref.read(currentIndexProvider.notifier).state++;
              } else {
                context.push("/login");
              }
            },
            text: nextIndex ? "Next" : "Get Started",
            textColor: AppColors.darkGrey,
            fontWeight: FontWeight.w600,
          ).withPadHorizontal(20),
        ],
      ).withPadCustom(const EdgeInsets.only(bottom: 50)),
    );
  }
}
