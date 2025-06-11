import 'package:flutter/material.dart';

class Inter extends StatelessWidget {
  const Inter({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // final double font = (fontSize ?? 30) * size.aspectRatio;
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontFamily: 'Inter',
        color: color ?? Theme.of(context).colorScheme.secondary,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
