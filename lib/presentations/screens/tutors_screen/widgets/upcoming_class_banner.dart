import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class UpcomingClassBanner extends StatelessWidget {
  const UpcomingClassBanner({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.upcomingDateFormat,
    required this.upcomingTimeFormat,
    required this.topLabel,
    required this.buttonLabel,
    required this.onTap,
    required this.width,
  });

  final DateTime startTime, endTime;
  final String topLabel, buttonLabel, upcomingDateFormat, upcomingTimeFormat;
  final double width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final startDateText = DateFormat(upcomingDateFormat).format(startTime);
    final startTimeText = DateFormat(upcomingTimeFormat).format(startTime);
    final endTimeText = DateFormat(upcomingTimeFormat).format(endTime);

    final upcomingText = '$startDateText at $startTimeText to $endTimeText';

    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
      ),
      padding: EdgeInsets.symmetric(
        vertical: Dimens.getProportionalScreenWidth(context, 28),
      ),
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topLabel,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: Dimens.getProportionalScreenWidth(context, 15),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          Text(
            upcomingText,
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: Dimens.getProportionalScreenWidth(context, 19),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          Text(
            '(in 05:02:01)',
            style: context.theme.textTheme.displaySmall!.copyWith(
              fontSize: Dimens.getProportionalScreenWidth(context, 15),
            ),
          ),
          const EmptyProportionalSpace(height: 15),
          PrimaryFillButton(
            width: Dimens.getProportionalScreenWidth(context, 160),
            bgColor: context.theme.colorScheme.secondary,
            preferGradient: false,
            boxShadow: [Effects.normalShadowSM],
            borderRadiusValue: Dimens.getScreenWidth(context),
            onTap: onTap,
            paddingVertical: Dimens.getProportionalScreenWidth(context, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login_rounded,
                  color: context.theme.colorScheme.onSecondary,
                  size: Dimens.getProportionalScreenWidth(context, 17),
                ),
                SizedBox(width: Dimens.getProportionalScreenWidth(context, 5)),
                Text(
                  buttonLabel,
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    color: context.theme.colorScheme.onSurfaceVariant,
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
