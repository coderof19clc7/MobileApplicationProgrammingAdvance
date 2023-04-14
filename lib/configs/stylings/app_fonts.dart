import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

class AppFonts {
  static final textThemeLight = TextTheme(
    displayLarge: const TextStyle(fontSize: 21, fontWeight: FontWeight.normal, color: AppColors.black),
    displayMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.black),
    displaySmall: const TextStyle(fontSize: 19, fontWeight: FontWeight.normal, color: AppColors.white), // always white (onPrimary)
    headlineLarge: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.black),
    headlineMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
    headlineSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black),
    titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.black),
    titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.black),
    titleSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.black),
    bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.black),
    bodyMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.black),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.neutralBlue500),
  );

  static final textThemeDark = TextTheme(
    displayLarge: const TextStyle(fontSize: 21, fontWeight: FontWeight.normal, color: AppColors.white),
    displayMedium: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: AppColors.white),
    displaySmall: const TextStyle(fontSize: 19, fontWeight: FontWeight.normal, color: AppColors.white), // always white (onPrimary)
    headlineLarge: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.white),
    headlineMedium: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
    headlineSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.white),
    titleLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.white),
    titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.white),
    titleSmall: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.white),
    bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.white),
    bodyMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: AppColors.white),
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: AppColors.neutralBlue400),
  );
}
