import 'package:flutter/material.dart';
import 'package:movie_app/Core/theme/styles.dart';
import 'app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColorDark,
  scaffoldBackgroundColor: AppColors.primaryColorDark,
  cardColor: AppColors.cardColorDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColorDark,
    foregroundColor: AppColors.accentColorDark,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: TextTheme(
    titleLarge: AppTextStyles.movieTitleDark,
    bodyMedium: AppTextStyles.descriptionText,
    headlineSmall: AppTextStyles.detailsTitle,
    labelMedium: AppTextStyles.chipTextDark,
    labelLarge: AppTextStyles.buttonTextDark,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: AppColors.chipBackgroundDark,
    side: BorderSide(color: AppColors.chipBorderDark),
    labelStyle: TextStyle(color: AppColors.textPrimaryDark),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonBackgroundDark,
      foregroundColor: AppColors.buttonTextColorDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      textStyle: AppTextStyles.buttonTextDark,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.accentColorDark,
    secondary: AppColors.textSecondaryDark,
    background: AppColors.primaryColorDark,
    surface: AppColors.cardColorDark,
  ),
);
