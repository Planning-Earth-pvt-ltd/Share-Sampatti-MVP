import 'package:flutter/material.dart';

class SpaceGrotesk extends StatelessWidget {
  const SpaceGrotesk({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "SpaceGrotesk",
        color: color ?? Theme.of(context).colorScheme.secondary,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
