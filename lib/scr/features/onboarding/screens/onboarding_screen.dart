// PACKAGE
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// RIVERPOD
import 'package:share_sampatti_mvp/scr/features/onboarding/onboarding.dart';

// COMPONENTS
import 'package:share_sampatti_mvp/common/common.dart';
import 'package:share_sampatti_mvp/core/core.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({super.key});

  @override
  ConsumerState<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding> {
  Timer? _timer;
  final int totalPages = 3;
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
      if (currentPage < totalPages - 1) {
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
    final pageController = ref.watch(pageProvider);
    final currentPage = ref.watch(currentPageProvider) < totalPages - 1;

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: AppConstants.title.length,
        onPageChanged: (index) =>
            ref.read(currentPageProvider.notifier).state = index,
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
            textColor: AppColors.darkGrey,
            fontWeight: FontWeight.w600,
          ).withPadHorizontal(20),
        ],
      ).withPadCustom(const EdgeInsets.only(bottom: 50)),
    );
  }
}
