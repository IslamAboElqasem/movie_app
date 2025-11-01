import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/theme/styles.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  cardColor: AppColors.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: TextTheme(
    titleLarge: AppTextStyles.movieTitle,
    bodyMedium: AppTextStyles.descriptionTextLight,
    headlineSmall: AppTextStyles.detailsTitleLight,
    labelMedium: AppTextStyles.chipText,
    labelLarge: AppTextStyles.buttonText,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: AppColors.chipBackground,
    side: BorderSide(color: AppColors.chipBorderColor),
    labelStyle: TextStyle(color: AppColors.textPrimary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonBackground,
      foregroundColor: AppColors.buttonTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      textStyle: AppTextStyles.buttonText,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.textSecondary,
    background: AppColors.scaffoldBackground,
    surface: AppColors.backgroundColor,
  ),
);
