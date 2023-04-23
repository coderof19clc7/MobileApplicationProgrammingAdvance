import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';

class CourseTutorCard extends BaseCard {
  const CourseTutorCard({
    super.key,
    super.isLoading = false,
    super.margin,
    super.firstChild,
    super.width,
    super.secondChildItemsDistance = 7,
    super.onTap,
    super.direction = CardDirection.column,
    super.firstChildAspectRatio,
    super.boxShadows,
    required this.name,
  });

  final String name;

  @override
  Widget buildSecondChild(BuildContext context) {
    // tutor information
    return Text(
      name,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontWeight: FontWeight.w600
      ),
    );
  }
}
