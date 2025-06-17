import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.radius,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String labelText;
  final double? radius;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey,
        labelText: labelText,
        hintText: hintText,
        hintStyle: style(AppColors.lightGrey, 15, FontWeight.w400),
        labelStyle: style(AppColors.lightGrey, 16, FontWeight.w400),
        floatingLabelStyle: style(
          Theme.of(context).colorScheme.primary,
          16,
          FontWeight.w600,
        ),
        enabledBorder: border(AppColors.grey),
        focusedBorder: border(Theme.of(context).colorScheme.primary),
        errorBorder: border(AppColors.red),
        focusedErrorBorder: border(AppColors.red),
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

  TextStyle style(Color color, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: "Inter",
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
