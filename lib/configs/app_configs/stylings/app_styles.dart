import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

class AppStyles {
  // bottom sheet theme data
  static BottomSheetThemeData bottomSheetThemeLight = const BottomSheetThemeData(
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
  );

  static BottomSheetThemeData bottomSheetThemeDark = BottomSheetThemeData(
    backgroundColor: AppColors.neutralBlue900,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
  );

  static const navigationRailThemeData = NavigationRailThemeData();

  static const tabBarTheme = TabBarTheme();

  static final popupMenuThemeDataLight = PopupMenuThemeData(
    color: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.black26),
    ),
  );

  static final popupMenuThemeDataDark = PopupMenuThemeData(
    color: AppColors.neutralBlue900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.black26),
    ),
  );
}
