import 'package:share_sampatti_mvp/app/app.dart';

class CustomElevatedButton extends ConsumerWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.forgroundColor,
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
  final Color? forgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor: forgroundColor ?? AppColors.darkGrey,
        minimumSize: Size(
          width ?? appDimensions.width,
          height ?? appDimensions.defaultButtonHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? appDimensions.radiusM),
        ),
      ),
      child: Inter(
        text: text,
        color: textColor ?? AppColors.darkGrey,
        fontSize: fontSize ?? appDimensions.fontS,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
