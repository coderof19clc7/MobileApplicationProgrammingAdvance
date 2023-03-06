import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

enum SvgIconEnum {
  googleFullColor,
  facebookFullColor,
  favorite,
}

class SvgIcons {
  static String getIcon(SvgIconEnum iconName, {
    Color? fillColor,
    Color? strokeColor,
    double? strokeWidth,
    bool filled = true,
    bool hasStroke = true,
  }) {
    final fillColorHexString = filled
        ? (fillColor ?? AppColors.primaryBlue400).toHex() : 'none';
    final strokeColorHexString = hasStroke
        ? (strokeColor ?? AppColors.primaryBlue400).toHex() : 'none';

    switch (iconName) {
      case SvgIconEnum.favorite:
        return _getFavoriteIcon(fillColorHexString, strokeColorHexString);
      default:
        return '';
    }
  }

  static String _getFavoriteIcon(String fillColor, String strokeColor) {
    return '''
<svg width="40" height="36" viewBox="0 0 40 36" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M21.695 33.6043L21.6901 33.6087C20.7437 34.468 19.2829 34.4675 18.3367 33.596L18.3367 33.596L18.3295 33.5894L18.1096 33.3895L18.1069 33.3871C12.8275 28.6105 8.5914 24.7689 5.68786 21.1698C2.80618 17.5978 1.39372 14.4506 1.50625 11.08C1.61035 8.14266 3.11925 5.33265 5.52953 3.69161L5.53035 3.69106C10.0824 0.587381 15.7605 1.9986 18.859 5.62523L19.9995 6.96007L21.1399 5.62523C24.2415 1.99496 29.9179 0.571138 34.4654 3.68888L34.4694 3.69161C36.88 5.33291 38.389 8.14352 38.4927 11.0813L38.4927 11.0825C38.6143 14.4509 37.2035 17.5969 34.3183 21.1751C31.4182 24.7718 27.1898 28.6136 21.9261 33.396L21.8949 33.4244L21.8896 33.4292L21.695 33.6043Z" fill="$fillColor" stroke="$strokeColor" stroke-width="4"/>
</svg>
''';
  }
}
