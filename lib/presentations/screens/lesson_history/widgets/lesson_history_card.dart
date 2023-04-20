import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class LessonHistoryCard extends BaseCard {
  const LessonHistoryCard({
    super.key,
    super.isLoading = false,
    super.firstChild,
    super.secondChildItemsDistance = 10,
    super.margin,
    super.crossAxisAlignment,
    required this.tutorName,
    required this.lessonDateTime,
    required this.lessonEndTime,
    required this.lessonDateFormat,
    required this.lessonDurationFormat,
    required this.buttonLabel,
    required this.isMarked,
    required this.onButtonTap,
  });

  final String tutorName;
  final DateTime lessonDateTime, lessonEndTime;
  final String lessonDateFormat, lessonDurationFormat, buttonLabel;
  final bool isMarked;
  final Function() onButtonTap;

  @override
  Widget buildSecondChild(BuildContext context) {
    final startTime = DateFormat(lessonDurationFormat).format(lessonDateTime);
    final endTime = DateFormat(lessonDurationFormat).format(lessonEndTime);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
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
                EmptyProportionalSpace(height: secondChildItemsDistance),
                buildInformationRow(
                  context: context,
                  icon: Icons.stars_rounded,
                  text: isMarked ? S.current.isMarked : S.current.isNotMarked,
                  isPilled: false,
                ),
              ],
            ),
          ),
          // buttonSet,
          SizedBox(
            child: PrimaryFillButton(
              width: Dimens.getProportionalWidth(context, 88),
              borderRadiusValue: Dimens.getProportionalWidth(context, 12),
              paddingVertical: Dimens.getProportionalHeight(context, 10),
              onTap: onButtonTap,
              boxShadow: [Effects.normalShadowXS],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: context.theme.colorScheme.onPrimary,
                    size: Dimens.getProportionalWidth(context, 16),
                  ),
                  SizedBox(
                    width: Dimens.getProportionalWidth(context, 5),
                  ),
                  Text(
                    buttonLabel,
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                      color: context.theme.colorScheme.onPrimary,
                      fontSize: Dimens.getProportionalWidth(context, 12),
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
        size: Dimens.getProportionalWidth(context, 14),
        color: context.theme.colorScheme.primary,
      ),
      text: Text(
        text,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          color: isPilled ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.onBackground,
          fontSize: Dimens.getProportionalWidth(context, 12),
        ),
      ),
    );
  }
}
