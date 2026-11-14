import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_typo.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary700,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary700,
        surface: AppColors.surface,
        onPrimary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),

      textTheme: TextTheme(
        displayLarge: AppTypography.displayHero.copyWith(
          color: AppColors.textPrimary,
        ),
        displayMedium: AppTypography.displayScript.copyWith(
          color: AppColors.textPrimary,
        ),
        headlineLarge: AppTypography.heading1.copyWith(
          color: AppColors.textPrimary,
        ),
        headlineMedium: AppTypography.heading2.copyWith(
          color: AppColors.textPrimary,
        ),
        headlineSmall: AppTypography.heading3.copyWith(
          color: AppColors.textPrimary,
        ),
        titleMedium: AppTypography.titleMedium.copyWith(
          color: AppColors.textPrimary,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
