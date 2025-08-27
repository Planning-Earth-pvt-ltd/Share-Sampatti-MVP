import 'package:share_sampatti_mvp/app/app.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.readOnly,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.radius,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? labelText;
  final Widget? prefixIcon;
  final double? radius;
  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appDimensions = ref.watch(appDimensionsProvider);

    OutlineInputBorder border(Color color) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(radius ?? appDimensions.radiusM),
      );
    }

    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      style: style(
        Theme.of(context).colorScheme.secondary,
        appDimensions.fontS,
        FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkGrey,
        labelText: labelText,
        hintText: hintText,
        hintStyle: style(AppColors.grey, appDimensions.fontS, FontWeight.w400),
        labelStyle: style(AppColors.grey, appDimensions.fontS, FontWeight.w400),
        floatingLabelStyle: style(
          Theme.of(context).colorScheme.primary,
          appDimensions.fontS,
          FontWeight.w600,
        ),
        prefixIcon: prefixIcon,
        enabledBorder: border(AppColors.darkGrey),
        focusedBorder: border(Theme.of(context).colorScheme.primary),
        errorBorder: border(AppColors.red),
        focusedErrorBorder: border(AppColors.red),
        disabledBorder: border(AppColors.darkGrey),
      ),
    );
  }

  TextStyle style(Color color, double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontFamily: AppConstants.interFontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
