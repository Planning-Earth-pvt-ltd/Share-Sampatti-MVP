import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

final currentIndexProvider = StateProvider<int>((ref) => 0);
