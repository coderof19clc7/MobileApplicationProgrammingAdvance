import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/stylings/app_fonts.dart';
import 'package:one_one_learn/configs/app_configs/stylings/app_styles.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryBlue400,
      onPrimary: AppColors.white, // text on primary
      // primaryContainer: ,
      // onPrimaryContainer: ,
      secondary: AppColors.primaryBlue200, // button on primary
      onSecondary: AppColors.primaryBlue500, // text on secondary
      secondaryContainer: AppColors.primaryBlue200, // fake chip
      onSecondaryContainer: AppColors.primaryBlue400, // text on fake chip
      tertiary: AppColors.primaryBlue200, // softer primary
      // onTertiary: ,
      tertiaryContainer: AppColors.white, // input bg color
      onTertiaryContainer: AppColors.black, // input text color
      background: AppColors.white,
      onBackground: AppColors.black, // icon, text on background
      outline: AppColors.grey, // border
      outlineVariant: AppColors.neutralBlue200, // border for component on surface | fill for disabled input/option button
      surface: AppColors.white, // card fill
      // onSurface: ,
      // surfaceVariant: ,
      onSurfaceVariant: AppColors.primaryBlue400, // always primaryBlue400
      surfaceTint: AppColors.white, // component on top of surface
      inverseSurface: AppColors.neutralBlue200, // login sign up text field fill
      onInverseSurface: AppColors.neutralBlue500, // always neutralBlue500
      errorContainer: AppColors.neutralRed200, // error/warning fill
      onErrorContainer: AppColors.red400, // error/warning text
      scrim: AppColors.neutralBlue400.withOpacity(0.5),
    ),
    scaffoldBackgroundColor: AppColors.white,
    highlightColor: AppColors.primaryBlue200.withOpacity(0.5),
    splashColor: AppColors.primaryBlue400.withOpacity(0.3),
    textTheme: AppFonts.textThemeLight,
    iconTheme: IconThemeData(color: AppColors.primaryBlue400),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    popupMenuTheme: AppStyles.popupMenuThemeDataLight,
    bottomSheetTheme: AppStyles.bottomSheetThemeLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedIconTheme: IconThemeData(color: AppColors.primaryBlue400),
      unselectedIconTheme: IconThemeData(color: AppColors.grey),
      selectedLabelStyle: AppFonts.textThemeLight.bodySmall!.copyWith(color: AppColors.primaryBlue400),
      unselectedLabelStyle: AppFonts.textThemeLight.bodySmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryBlue400,
      unselectedItemColor: AppColors.grey,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryBlue500,
      onPrimary: AppColors.white, // text on primary
      secondary: AppColors.primaryBlue200, // button on primary
      onSecondary: AppColors.primaryBlue500, // text on secondary
      secondaryContainer: AppColors.primaryBlue900, // fake chip
      onSecondaryContainer: AppColors.primaryBlue300, // text on fake chip
      tertiary: AppColors.primaryBlue500, // softer primary
      tertiaryContainer: AppColors.neutralBlue900, // input bg color
      onTertiaryContainer: AppColors.neutralBlue400, // input text color
      background: AppColors.black,
      onBackground: AppColors.white, // icon, text on background
      outline: AppColors.transparent, // border
      outlineVariant: AppColors.neutralBlue700, // border for component on surface | fill for disabled input/option button
      surface: AppColors.neutralBlue900, // card fill
      // surfaceVariant: ,
      onSurfaceVariant: AppColors.primaryBlue400, // always primaryBlue400
      surfaceTint: AppColors.neutralBlue700, // component on top of surface
      inverseSurface: AppColors.neutralBlue900, // login sign up text field fill
      onInverseSurface: AppColors.neutralBlue500, // always neutralBlue500
      errorContainer: AppColors.neutralRed700, // error/warning fill
      onErrorContainer: AppColors.red300, // error/warning text
      scrim: AppColors.neutralBlue700,
    ),
    scaffoldBackgroundColor: AppColors.black,
    highlightColor: AppColors.primaryBlue800.withOpacity(0.5),
    splashColor: AppColors.primaryBlue500.withOpacity(0.3),
    textTheme: AppFonts.textThemeDark,
    iconTheme: IconThemeData(color: AppColors.primaryBlue500),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.neutralBlue900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    bottomSheetTheme: AppStyles.bottomSheetThemeDark,
    popupMenuTheme: AppStyles.popupMenuThemeDataDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedIconTheme: IconThemeData(color: AppColors.primaryBlue400),
      unselectedIconTheme: IconThemeData(color: AppColors.grey),
      selectedLabelStyle: AppFonts.textThemeLight.bodySmall!.copyWith(color: AppColors.primaryBlue400),
      unselectedLabelStyle: AppFonts.textThemeLight.bodySmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryBlue400,
      unselectedItemColor: AppColors.grey,
    ),
  );
}
