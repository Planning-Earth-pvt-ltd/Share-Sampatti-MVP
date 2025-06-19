import 'package:share_sampatti_mvp/app/app.dart';

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
    final appDimens = ref.watch(appDimensionsProvider);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor: AppColors.black,
        minimumSize: Size(width ?? double.infinity, height ?? 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? appDimens.radiusMedium(context),
          ),
        ),
      ),
      child: Inter(
        text: text,
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
