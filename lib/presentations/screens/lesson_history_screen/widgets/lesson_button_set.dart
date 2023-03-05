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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          spacing: Dimens.getProportionalScreenWidth(context, 10),
          children: [
            PrimaryOutlineButton(
              width: Dimens.getProportionalScreenWidth(context, 45),
              height: Dimens.getProportionalScreenHeight(context, 30),
              onTap: onTapRecord,
              child: Icon(
                Icons.missed_video_call_rounded,
                color: AppColors.primaryBlue400,
                size: Dimens.getProportionalScreenHeight(context, 28),
              ),
            ),
            PrimaryOutlineButton(
              width: Dimens.getProportionalScreenWidth(context, 45),
              height: Dimens.getProportionalScreenHeight(context, 30),
              onTap: onTapReview,
              child: Icon(
                Icons.rate_review_rounded,
                color: AppColors.primaryBlue400,
                size: Dimens.getProportionalScreenHeight(context, 19),
              ),
            ),
          ],
        ),
        const EmptyProportionalSpace(height: 10),
        PrimaryFillButton(
          width: Dimens.getProportionalScreenWidth(context, 100),
          height: Dimens.getProportionalScreenHeight(context, 30),
          onTap: onTapFeedback,
          child: Icon(
            Icons.grading_rounded,
            color: AppColors.white,
            size: Dimens.getProportionalScreenHeight(context, 20),
          ),
        ),
      ],
    );
  }
}
