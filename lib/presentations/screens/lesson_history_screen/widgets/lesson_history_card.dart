import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';

class LessonHistoryCard extends BaseCard {
  const LessonHistoryCard({
    super.key,
    super.firstChild,
    super.secondChildItemsDistance = 10,
    super.margin,
    required this.tutorName,
    required this.lessonDateTime,
    required this.lessonEndTime,
    required this.lessonDateFormat,
    required this.lessonDurationFormat,
    required this.buttonSet,
    required this.isMarked,
  });

  final String tutorName;
  final DateTime lessonDateTime, lessonEndTime;
  final String lessonDateFormat, lessonDurationFormat;
  final Widget buttonSet;
  final bool isMarked;

  @override
  Widget buildSecondChild(BuildContext context) {
    final startTime = DateFormat(lessonDurationFormat).format(lessonDateTime);
    final endTime = DateFormat(lessonDurationFormat).format(lessonEndTime);

    return Expanded(
      child: SizedBox(
        height: Dimens.getProportionalScreenWidth(context, 90),
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
                buildInformationRow(
                  context: context,
                  icon: Icons.stars_rounded,
                  text: isMarked ? S.current.isMarked : S.current.isNotMarked,
                  isPilled: false,
                ),
              ],
            ),
            buttonSet,
          ],
        ),
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
          size: Dimens.getProportionalScreenHeight(context, 14),
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
              fontSize: Dimens.getProportionalScreenHeight(context, 11),
            ),
          ),
        )
      ],
    );
  }
}
