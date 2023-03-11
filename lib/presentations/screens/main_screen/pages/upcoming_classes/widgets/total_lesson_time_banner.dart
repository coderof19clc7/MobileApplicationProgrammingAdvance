import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class TotalLessonTimeBanner extends StatelessWidget {
  const TotalLessonTimeBanner({
    super.key,
    required this.topLabel,
    required this.totalTime,
    required this.buttonLabel,
    required this.onTap,
    required this.width,
  });

  final String topLabel, totalTime, buttonLabel;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      padding: EdgeInsets.only(
        top: Dimens.getTopSafeAreaHeight(context)
            + Dimens.getProportionalScreenHeight(context, 28),
        bottom: Dimens.getProportionalScreenHeight(context, 28),
      ),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topLabel,
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
              color: AppColors.white,
              fontSize: Dimens.getProportionalScreenWidth(context, 15),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          Text(
            totalTime,
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: Dimens.getProportionalScreenWidth(context, 24),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          PrimaryFillButton(
            width: Dimens.getProportionalScreenWidth(context, 160),
            bgColor: AppColors.primaryBlue200,
            preferGradient: false,
            boxShadow: [Effects.normalShadowSM],
            borderRadiusValue: Dimens.getScreenWidth(context),
            onTap: onTap,
            paddingVertical: Dimens.getProportionalScreenWidth(context, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu_book_rounded,
                  color: AppColors.primaryBlue500,
                  size: Dimens.getProportionalScreenWidth(context, 17),
                ),
                SizedBox(width: Dimens.getProportionalScreenWidth(context, 5)),
                Text(
                  buttonLabel,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    color: AppColors.primaryBlue500,
                    fontSize: Dimens.getProportionalScreenWidth(context, 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
