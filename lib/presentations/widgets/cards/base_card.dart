import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

enum CardDirection { row, column }

abstract class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.firstSecondDistance = 16,
    this.secondChildItemsDistance = 10,
    this.firstChild,
    this.direction = CardDirection.row,
    this.crossAxisAlignment,
    this.onTap,
  });

  final EdgeInsetsGeometry? padding, margin;
  final double? width;
  final double firstSecondDistance, secondChildItemsDistance;
  final Widget? firstChild;
  final CardDirection direction;
  final CrossAxisAlignment? crossAxisAlignment;
  final Function()? onTap;

  Widget buildFirstChild(BuildContext context) {
    return SizedBox(
      width: direction == CardDirection.row ? Dimens.getProportionalWidth(context, 90) : Dimens.getScreenWidth(context),
      child: AspectRatio(
        aspectRatio: direction == CardDirection.row ? 1 : 2,
        child: firstChild ??
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.neutralBlue500,
              ),
            ),
      ),
    );
  }

  Widget buildSecondChild(BuildContext context);

  Widget buildRowLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        buildFirstChild(context),
        SizedBox(
          width: Dimens.getProportionalWidth(
            context,
            firstSecondDistance,
          ),
        ),
        buildSecondChild(context),
      ],
    );
  }

  Widget buildColumnLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
      children: [
        buildFirstChild(context),
        SizedBox(
            height: Dimens.getProportionalHeight(
          context,
          firstSecondDistance,
        )),
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
