import 'package:flutter/material.dart';

import 'package:share_sampatti_mvp/common/custom_widgets/custom_buttons/custom_base_button.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_texts/inter.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _controller;
  List<String> title = [
    "Your Gateway to Smart Real Estate Investment",
    "Own Property Starting At Just ₹2000",
    "Smart Moves Rising Results",
  ];

  List<String> images = [
    AppAssets.onboarding1,
    AppAssets.onboarding2,
    AppAssets.onboarding3,
  ];

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height - 178,
              child: PageView.builder(
                itemCount: title.length,
                controller: _controller,
                itemBuilder: (context, index) => Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Inter(
                        text: title[index],
                        color: AppColors.lightGreen,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 100),
                    Image.asset(images[index]),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: SlideEffect(
                    activeDotColor: AppColors.lightGreen,
                    dotColor: AppColors.lightGreen.withAlpha(100),
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                SizedBox(height: 20),
                CustomElevatedButton(
                  onpressed: () {},
                  width: 300,
                  text: "Get Started",
                  color: Theme.of(context).colorScheme.tertiary,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
