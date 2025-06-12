import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = Provider.autoDispose<Map<String, TextEditingController>>((
  ref,
) {
  final controller = {
    "name": TextEditingController(),
    "mobileNumber": TextEditingController(),
  };
  ref.onDispose(() {
    for (final controller in controller.values) {
      controller.dispose();
    }
  });
  return controller;
});

final codeProvider = StateProvider<String>((ref) => "");
