import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:shimmer/shimmer.dart';

class LinearShimmer extends StatelessWidget {
  const LinearShimmer({
    super.key,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.radius,
  });
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? Dimens.getScreenWidth(context),
      height: height,
      child: Shimmer.fromColors(
        baseColor: AppColors.neutralBlue100,
        highlightColor: AppColors.neutralBlue50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 0),
            color: AppColors.neutralBlue100,
          ),
        ),
      ),
    );
  }
}
