import 'package:share_sampatti_mvp/core/config/config.dart';

final ThemeData dark = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    surfaceTintColor: AppColors.black,
    titleTextStyle: TextStyle(
      fontFamily: "Inter",
      color: AppColors.lightGreen,
      fontSize: 20.75,
      fontWeight: FontWeight.w600,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.lightGreen,
    secondary: AppColors.white,
    tertiary: AppColors.black,
  ),
);
