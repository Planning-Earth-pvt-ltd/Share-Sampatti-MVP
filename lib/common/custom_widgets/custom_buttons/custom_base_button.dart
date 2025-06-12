import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_sampatti_mvp/common/custom_widgets/custom_texts/inter.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

class CustomElevatedButton extends ConsumerWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  final void Function() onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final Size size = MediaQuery.of(context).size;
    // final double sizeHeight = (height ?? 0.05) * size.height;
    // final double sizeWidth = (width ?? 0.6) * size.width;
    final appDimens = ref.watch(appDimensionsProvider);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor: AppColors.black,
        minimumSize: Size.fromHeight(height ?? 50),
        // minimumSize: Size(width ?? 300, height ?? 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? appDimens.radiusLarge(context),
          ),
        ),
      ),
      child: Inter(
        text: text,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
