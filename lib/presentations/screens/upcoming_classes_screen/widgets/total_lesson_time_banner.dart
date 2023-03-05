import 'package:flutter/material.dart';
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
    required this.height,
  });

  final String topLabel, totalTime, buttonLabel;
  final double width, height;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topLabel,
            style: TextStyle(
              color: AppColors.white,
              fontSize: Dimens.getProportionalScreenHeight(context, 15),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          Text(
            totalTime,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: Dimens.getProportionalScreenHeight(context, 19),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          PrimaryFillButton(
            width: Dimens.getProportionalScreenWidth(context, 145),
            bgColor: AppColors.primaryBlue200,
            preferGradient: false,
            borderRadiusValue: Dimens.getScreenWidth(context),
            onTap: onTap,
            paddingVertical: Dimens.getProportionalScreenHeight(context, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu_book_rounded,
                  color: AppColors.primaryBlue500,
                  size: Dimens.getProportionalScreenHeight(context, 18),
                ),
                SizedBox(width: Dimens.getProportionalScreenWidth(context, 5)),
                Text(
                  buttonLabel,
                  style: TextStyle(
                    color: AppColors.primaryBlue500,
                    fontSize: Dimens.getProportionalScreenHeight(context, 11),
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
