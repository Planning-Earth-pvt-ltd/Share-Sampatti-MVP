import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/app/app.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    this.onTap,
    this.fontSize,
  });

  final String text;
  final void Function()? onTap;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Inter(
        text: text,
        color: Theme.of(context).colorScheme.primary,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
