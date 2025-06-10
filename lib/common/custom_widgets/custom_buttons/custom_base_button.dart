import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_texts/inter.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onpressed,
    this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final void Function() onpressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        minimumSize: Size(width ?? 70, height ?? 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
      ),
      child: Inter(
        text: text,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
