import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

class PrimaryFillButton extends StatelessWidget {
  const PrimaryFillButton({
    super.key, this.onTap,
    required this.child,
    this.width = 160, this.height,
    this.splashColor = Colors.white38,
    this.customBorder,
    this.preferGradient = true,
    this.hasShadow = true,
    this.bgLinearGradient,
    this.bgColor,
    this.borderRadiusValue = 8,
    this.paddingVertical,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final double? width, height;
  final GestureTapCallback? onTap;
  final Color? splashColor;
  final ShapeBorder? customBorder;
  final bool preferGradient;
  final bool hasShadow;
  final LinearGradient? bgLinearGradient;
  final Color? bgColor;
  final double borderRadiusValue;
  final double? paddingVertical;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    var gradient = bgLinearGradient;
    var color = bgColor;
    if (preferGradient) {
      gradient ??= AppColors.primaryGradient;
      color = null;
    } else {
      color ??= AppColors.primaryBlue400;
      gradient = null;
    }
    return Container(
      width: width, height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: color,
        gradient: gradient,
        boxShadow: hasShadow ? [Effects.primaryShadow] : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: customBorder ?? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          splashColor: splashColor,
          child: Container(
            alignment: alignment,
            width: width, height: height,
            padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 0),
            child: child,
          ),
        ),
      ),
    );
  }
}
