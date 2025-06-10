import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.radius,
  });

  final TextEditingController controller;
  final String hintText;
  final double? radius;

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
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style(white),
        errorBorder: border(Colors.red),
        focusedBorder: border(Theme.of(context).colorScheme.primary),
        border: border(darkGrey),
      ),
    );
  }
}
