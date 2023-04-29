import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/linear_shimmer.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

enum CardDirection { row, column }

abstract class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.isLoading,
    this.padding,
    this.margin,
    this.width,
    this.firstSecondDistance = 16,
    this.secondChildItemsDistance = 10,
    this.firstChild,
    this.direction = CardDirection.row,
    this.crossAxisAlignment,
    this.firstChildAspectRatio,
    this.decoration,
    this.onTap,
  });

  final bool isLoading;
  final EdgeInsetsGeometry? padding, margin;
  final double? width;
  final double firstSecondDistance, secondChildItemsDistance;
  final Widget? firstChild;
  final CardDirection direction;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? firstChildAspectRatio;
  final BoxDecoration? decoration;
  final Function()? onTap;

  Widget buildFirstChild(BuildContext context) {
    return SizedBox(
      width: direction == CardDirection.row ? Dimens.getProportionalWidth(context, 90) : Dimens.getScreenWidth(context),
      child: AspectRatio(
        aspectRatio: firstChildAspectRatio ?? ( direction == CardDirection.row ? 1 : 2),
        child: firstChild ?? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
                color: AppColors.neutralBlue500,
              ),
            ),
      ),
    );
  }

  Widget buildSimpleRectangleShimmer(BuildContext context, {
    bool isLinear = false,
  }) {
    if (isLinear) {
      return LinearShimmer(
        width: Dimens.getScreenWidth(context) * 0.3,
        height: Dimens.getScreenHeight(context) * 0.02,
        radius: 15,
      );
    }

    return AppFadeShimmer(
      width: Dimens.getScreenWidth(context) * 0.3,
      height: Dimens.getScreenHeight(context) * 0.02,
      radius: 15,
    );
  }

  Widget buildSecondChild(BuildContext context);

  Widget buildRowLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        buildFirstChild(context),
        EmptyProportionalSpace(width: firstSecondDistance),
        buildSecondChild(context),
      ],
    );
  }

  Widget buildColumnLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
      children: [
        buildFirstChild(context),
        EmptyProportionalSpace(height: firstSecondDistance),
        buildSecondChild(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding ??
            EdgeInsets.all(
              Dimens.getProportionalWidth(context, 14),
            ),
        margin: margin ??
            EdgeInsets.only(
              bottom: Dimens.getProportionalHeight(context, 15),
            ),
        width: width ?? Dimens.getScreenWidth(context),
        decoration: decoration ?? BoxDecoration(
          border: Border.all(
            color: AppColors.neutralBlue300,
          ),
          borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
          boxShadow: [
            Effects.normalShadowXS,
          ],
          color: context.theme.colorScheme.surface,
        ),
        child: direction == CardDirection.row ? buildRowLayout(context) : buildColumnLayout(context),
      ),
    );
  }
}
