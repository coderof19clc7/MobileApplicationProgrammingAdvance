import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class RowIconTextInformation extends StatelessWidget {
  const RowIconTextInformation({
    super.key,
    required this.context,
    required this.icon,
    required this.text,
    this.isPilled = false,
    this.betweenSpace = 5,
  });

  final BuildContext context;
  final Widget icon;
  final Widget text;
  final bool isPilled;
  final double betweenSpace;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        EmptyProportionalSpace(width: betweenSpace),
        Flexible(
          child: Container(
            decoration: isPilled
                ? BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.primaryBlue400,
            )
                : null,
            padding: isPilled
                ? EdgeInsets.symmetric(
              horizontal: Dimens.getProportionalWidth(context, 3),
            )
                : null,
            child: text,
          ),
        )
      ],
    );
  }
}
