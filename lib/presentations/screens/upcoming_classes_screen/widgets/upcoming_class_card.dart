import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInformationRow(
                context: context,
                icon: Icons.calendar_month_rounded,
                text: DateFormat(lessonDateFormat).format(lessonDateTime),
                isPilled: false,
              ),
              EmptyProportionalSpace(height: secondChildItemsDistance),
              buildInformationRow(
                context: context,
                icon: Icons.access_time_rounded,
                text: '$startTime - $endTime',
                isPilled: true,
              ),
              EmptyProportionalSpace(height: secondChildItemsDistance),
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
    return RowIconTextInformation(
      context: context,
      isPilled: isPilled,
      icon: Icon(
        icon,
        size: Dimens.getProportionalScreenWidth(context, 14),
        color: AppColors.primaryBlue400,
      ),
      text: Text(
        text,
        style: TextStyle(
          color: isPilled ? AppColors.white : AppColors.black,
          fontSize: Dimens.getProportionalScreenWidth(context, 12),
        ),
      ),
    );
  }
}
