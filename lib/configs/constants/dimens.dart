import 'package:flutter/material.dart';

class Dimens {
  static const double figmaWidth = 390;
  static const double figmaHeight = 844;

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getTopSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getProportionalWidth(BuildContext context, double width) {
    return (width / figmaWidth) * MediaQuery.of(context).size.width;
  }

  static double getProportionalHeight(BuildContext context, double height) {
    return (height / figmaHeight) * MediaQuery.of(context).size.height;
  }

  static TextStyle getProportionalFont(BuildContext context, TextStyle? textStyle) {
    return TextStyle(
      fontSize: getProportionalWidth(context, textStyle?.fontSize ?? 14),
      fontWeight: textStyle?.fontWeight,
      color: textStyle?.color,
    );
  }

}
