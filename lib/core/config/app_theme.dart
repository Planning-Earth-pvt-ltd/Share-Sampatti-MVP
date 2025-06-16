import 'package:flutter/material.dart';
import 'package:share_sampatti_mvp/core/config/config.dart';

final ThemeData dark = ThemeData(
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    surfaceTintColor: AppColors.black,
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.lightGreen,
    secondary: AppColors.white,
    tertiary: AppColors.black,
  ),
);
