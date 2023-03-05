import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';

class UpcomingClassCard extends StatelessWidget {
  const UpcomingClassCard({
    super.key,
    required this.valueKey,
    required this.onDismissed,
    required this.confirmDismiss,
    required this.onTap,
    required this.tutorName,
    required this.buttonLabel,
    required this.lessonDateTime,
    required this.lessonDateFormat,
    required this.lessonDurationFormat,
    required this.margin,
    required this.lessonEndTime,
  });

  final ValueKey valueKey;
  final Function(DismissDirection) onDismissed;
  final Future<bool?> Function(DismissDirection) confirmDismiss;
  final Function() onTap;
  final String tutorName;
  final String buttonLabel;
  final DateTime lessonDateTime;
  final DateTime lessonEndTime;
  final String lessonDateFormat;
  final String lessonDurationFormat;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final startTime = DateFormat(lessonDurationFormat).format(lessonDateTime);
    final endTime = DateFormat(lessonDurationFormat).format(lessonEndTime);

    return Dismissible(
      key: valueKey,
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      confirmDismiss: confirmDismiss,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getProportionalScreenWidth(context, 14),
          vertical: Dimens.getProportionalScreenHeight(context, 14),
        ),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            Effects.normalShadow,
          ],
          color: AppColors.white,
        ),
        child: Row(
          children: [
            // image
            Container(
              width: Dimens.getProportionalScreenWidth(context, 54),
              height: Dimens.getProportionalScreenWidth(context, 54),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.neutralBlue500,
              ),
            ),
            SizedBox(
              width: Dimens.getProportionalScreenWidth(context, 10),
            ),
            // information
            Expanded(
              child: Wrap(
                direction: Axis.vertical,
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
            ),
            // button
            PrimaryOutlineButton(
              width: Dimens.getProportionalScreenWidth(context, 94),
              paddingVertical: Dimens.getProportionalScreenHeight(context, 5),
              onTap: onTap,
              splashColor: AppColors.primaryBlue400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login_rounded,
                    size: Dimens.getProportionalScreenHeight(context, 14),
                    color: AppColors.primaryBlue400,
                  ),
                  SizedBox(
                    width: Dimens.getProportionalScreenWidth(context, 5),
                  ),
                  Text(
                    buttonLabel,
                    style: TextStyle(
                      color: AppColors.primaryBlue400,
                      fontSize: Dimens.getProportionalScreenHeight(context, 11),
                    ),
                  )
                ],
              ),
            ),
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
    return Row(
      children: [
        Icon(
          icon,
          size: Dimens.getProportionalScreenHeight(context, 14),
          color: AppColors.primaryBlue400,
        ),
        SizedBox(
          width: Dimens.getProportionalScreenWidth(context, 5),
        ),
        isPilled
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primaryBlue400,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.getProportionalScreenWidth(context, 3),
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: Dimens.getProportionalScreenHeight(context, 11),
                  ),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: Dimens.getProportionalScreenHeight(context, 11),
                ),
              )
      ],
    );
  }
}
