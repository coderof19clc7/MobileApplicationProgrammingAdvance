import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class AppFadeShimmer extends StatelessWidget {
  const AppFadeShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.isCircle = false,
  });

  final double? width;
  final double? height;
  final double? radius;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    final baseColor = context.theme.colorScheme.inverseSurface.withOpacity(0.3);
    final highlightColor = context.theme.colorScheme.onInverseSurface.withOpacity(0.3);
    if (isCircle) {
      return _buildCircleShimmer(context, baseColor, highlightColor);
    } else {
      return _buildRectangleShimmer(context, baseColor, highlightColor);
    }
  }

  Widget _buildCircleShimmer(BuildContext context, Color baseColor, Color highlightColor) {
    return FadeShimmer.round(
      size: Dimens.getProportionalWidth(context, 40),
      baseColor: baseColor,
      highlightColor: highlightColor,
    );
  }

  Widget _buildRectangleShimmer(BuildContext context, Color baseColor, Color highlightColor) {
    return FadeShimmer(
      width: width ?? Dimens.getScreenWidth(context),
      height: height ?? Dimens.getScreenHeight(context) * 0.01,
      radius: radius ?? 8,
      baseColor: baseColor,
      highlightColor: highlightColor,
    );
  }
}
