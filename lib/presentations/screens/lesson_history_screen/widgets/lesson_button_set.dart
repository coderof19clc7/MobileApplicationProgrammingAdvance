import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class LessonButtonSet extends StatelessWidget {
  const LessonButtonSet({
    super.key,
    required this.onTapRecord,
    required this.onTapReview,
    required this.onTapFeedback,
  });

  final Function() onTapRecord, onTapReview, onTapFeedback;

  @override
  Widget build(BuildContext context) {
    const iconSize = 20.0;
    const verticalPadding = 5.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: Dimens.getProportionalScreenWidth(context, 10),
          children: [
            PrimaryOutlineButton(
              width: Dimens.getProportionalScreenWidth(context, 45),
              paddingVertical: Dimens.getProportionalScreenHeight(
                context, verticalPadding,
              ),
              onTap: onTapRecord,
              child: Icon(
                Icons.missed_video_call_rounded,
                color: AppColors.primaryBlue400,
                size: Dimens.getProportionalScreenWidth(context, iconSize),
              ),
            ),
            PrimaryOutlineButton(
              width: Dimens.getProportionalScreenWidth(context, 45),
              paddingVertical: Dimens.getProportionalScreenHeight(
                context, verticalPadding,
              ),
              onTap: onTapReview,
              child: Icon(
                Icons.rate_review_rounded,
                color: AppColors.primaryBlue400,
                size: Dimens.getProportionalScreenWidth(context, iconSize),
              ),
            ),
          ],
        ),
        const EmptyProportionalSpace(height: 10),
        PrimaryFillButton(
          width: Dimens.getProportionalScreenWidth(context, 100),
          paddingVertical: Dimens.getProportionalScreenHeight(
            context, verticalPadding,
          ),
          onTap: onTapFeedback,
          child: Icon(
            Icons.grading_rounded,
            color: AppColors.white,
            size: Dimens.getProportionalScreenWidth(context, iconSize),
          ),
        ),
      ],
    );
  }
}
