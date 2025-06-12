import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.validator,
    this.radius, required String hintText,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String labelText;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        labelText: labelText.toUpperCase(),
        labelStyle: style(AppColors.white),
        floatingLabelStyle: style(Theme.of(context).colorScheme.primary),
        enabledBorder: border(AppColors.grey),
        focusedBorder: border(Theme.of(context).colorScheme.primary),
        errorBorder: border(AppColors.red),
        disabledBorder: border(AppColors.black),
      ),
    );
  }

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(radius ?? 10),
    );
  }

  TextStyle style(color) {
    return TextStyle(fontFamily: "Inter", color: color, fontSize: 14);
  }
}
