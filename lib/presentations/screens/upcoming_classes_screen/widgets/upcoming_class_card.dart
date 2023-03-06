import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';

class UpcomingClassCard extends BaseCard {
  const UpcomingClassCard({
    super.key,
    super.firstChild,
    super.secondChildItemsDistance = 10,
    super.margin,
    super.crossAxisAlignment,
    required this.onTap,
    required this.tutorName,
    required this.buttonLabel,
    required this.lessonDateTime,
    required this.lessonEndTime,
    required this.lessonDateFormat,
    required this.lessonDurationFormat,
  });

  final Function() onTap;
  final String tutorName, buttonLabel;
  final DateTime lessonDateTime, lessonEndTime;
  final String lessonDateFormat, lessonDurationFormat;

  @override
  Widget buildSecondChild(BuildContext context) {
    final startTime = DateFormat(lessonDurationFormat).format(lessonDateTime);
    final endTime = DateFormat(lessonDurationFormat).format(lessonEndTime);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            spacing: Dimens.getProportionalScreenHeight(context, 10),
            children: [
              buildInformationRow(
                context: context,
                icon: Icons.calendar_month_rounded,
                text: DateFormat(lessonDateFormat).format(lessonDateTime),
                isPilled: false,
              ),
              buildInformationRow(
                context: context,
                icon: Icons.access_time_rounded,
                text: '$startTime - $endTime',
                isPilled: true,
              ),
              buildInformationRow(
                context: context,
                icon: Icons.person_rounded,
                text: tutorName,
                isPilled: false,
              ),
            ],
          ),
          SizedBox(
            child: PrimaryOutlineButton(
              width: Dimens.getProportionalScreenWidth(context, 90),
              borderRadiusValue: Dimens.getProportionalScreenWidth(context, 12),
              paddingVertical: Dimens.getProportionalScreenHeight(context, 10),
              onTap: onTap,
              splashColor: AppColors.primaryBlue100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login_rounded,
                    size: Dimens.getProportionalScreenWidth(context, 16),
                    color: AppColors.primaryBlue400,
                  ),
                  SizedBox(
                    width: Dimens.getProportionalScreenWidth(context, 5),
                  ),
                  Text(
                    buttonLabel,
                    style: TextStyle(
                      color: AppColors.primaryBlue400,
                      fontSize:
                          Dimens.getProportionalScreenWidth(context, 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInformationRow({
    required BuildContext context,
    required IconData icon,
    required String text,
    required bool isPilled,
  }) {
    return Wrap(
      spacing: Dimens.getProportionalScreenWidth(context, 5),
      children: [
        Icon(
          icon,
          size: Dimens.getProportionalScreenWidth(context, 14),
          color: AppColors.primaryBlue400,
        ),
        Container(
          decoration: isPilled
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryBlue400,
                )
              : null,
          padding: isPilled
              ? EdgeInsets.symmetric(
                  horizontal: Dimens.getProportionalScreenWidth(context, 3),
                )
              : null,
          child: Text(
            text,
            style: TextStyle(
              color: isPilled ? AppColors.white : AppColors.black,
              fontSize: Dimens.getProportionalScreenWidth(context, 12),
            ),
          ),
        )
      ],
    );
  }
}
