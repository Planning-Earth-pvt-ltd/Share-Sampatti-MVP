import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class Advertisment extends StatefulWidget {
  const Advertisment({super.key});

  @override
  State<Advertisment> createState() => _AdvertismentState();
}

class _AdvertismentState extends State<Advertisment> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentAdv = 0;

  @override
  void initState() {
    super.initState();
    _autoScroll();
  }

  _autoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) {
      _currentAdv = (_currentAdv + 1) % AppAssets.advertisementImages.length;
      _pageController.animateToPage(
        _currentAdv,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.3,
      child: PageView.builder(
        itemCount: AppAssets.advertisementImages.length,
        controller: _pageController,
        itemBuilder: (context, index) =>
            Image.asset(AppAssets.advertisementImages[index]),
      ),
    );
  }
}
