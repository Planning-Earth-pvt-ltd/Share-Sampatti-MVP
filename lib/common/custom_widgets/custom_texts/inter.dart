import 'package:share_sampatti_mvp/app/app.dart';

class Inter extends StatelessWidget {
  const Inter({
    super.key,
    required this.text,
    this.height,
    this.letterSpacing,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.decoration,
  });

  final String text;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        fontFamily: 'Inter',
        height: height ?? 1.5,
        letterSpacing: letterSpacing ?? 0.5,
        color: color ?? Theme.of(context).colorScheme.secondary,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

class CustomText {
  static buildHeadingText(String text) {
    return Inter(
      text: text,
      color: AppColors.lightGrey,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    );
  }

  // static buildHelperText(String text) {
  //   return Inter(
  //     text: "+91 XXXXXX4475",
  //     color: AppColors.lightGrey,
  //     fontSize: 12,
  //   );
  // }
}
