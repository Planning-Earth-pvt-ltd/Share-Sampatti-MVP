import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PAGE
final pageProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

// AUTO SCROLL
final currentPageProvider = StateProvider<int>((ref) => 0);
