import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    super.key,
    this.onTap,
    required this.child,
    this.width = 160,
    this.height,
    this.splashColor = Colors.white38,
    this.highlightColor = Colors.white24,
    this.customBorder,
    this.preferGradient = true,
    this.bgLinearGradient,
    this.bgColor,
    this.bodyColor,
    this.borderRadiusValue = 8,
    this.paddingVertical,
    this.alignment = Alignment.center,
  });

  final Widget child;
  final double? width, height;
  final GestureTapCallback? onTap;
  final Color? splashColor;
  final Color? highlightColor;
  final ShapeBorder? customBorder;
  final bool preferGradient;
  final LinearGradient? bgLinearGradient;
  final Color? bgColor;
  final Color? bodyColor;
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
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: color,
        gradient: gradient,
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusValue - 1),
          color: bodyColor ?? AppColors.white,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            customBorder: customBorder ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                ),
            splashColor: splashColor,
            highlightColor: highlightColor,
            child: Container(
              alignment: alignment,
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadiusValue - 1),
                // color: bodyColor ?? AppColors.blue50.withOpacity(0.1),
              ),
              padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
