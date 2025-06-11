import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.radius,
  });

  final TextEditingController controller;
  final String hintText;
  final double? radius;
  final FocusNode _focusNode = FocusNode();

  border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(radius ?? 10),
    );
  }

  style(color) {
    return TextStyle(fontFamily: "Inter", color: color, fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: _focusNode,
      onTapOutside: (event) => _focusNode.unfocus(),
      decoration: InputDecoration(
        hintText: hintText.toUpperCase(),
        hintStyle: style(AppColors.white),
        errorBorder: border(AppColors.red),
        focusedBorder: border(Theme.of(context).colorScheme.primary),
        enabledBorder: border(AppColors.grey),
      ),
    );
  }
}
