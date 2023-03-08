import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/cards/base_card.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class LessonHistoryCard extends BaseCard {
  const LessonHistoryCard({
    super.key,
    super.firstChild,
    super.secondChildItemsDistance = 10,
    super.margin,
    super.crossAxisAlignment,
    required this.tutorName,
    required this.lessonDateTime,
    required this.lessonEndTime,
    required this.lessonDateFormat,
    required this.lessonDurationFormat,
    // required this.buttonSet,
    required this.isMarked,
  });

  final String tutorName;
  final DateTime lessonDateTime, lessonEndTime;
  final String lessonDateFormat, lessonDurationFormat;
  // final Widget buttonSet;
  final bool isMarked;

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
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                right: Dimens.getProportionalScreenWidth(context, 5),
              ),
              child: SvgPicture.string(
                SvgIcons.getIcon(
                  SvgIconEnum.rightArrow,
                  fillColor: context.theme.colorScheme.onInverseSurface,
                ),
                width: Dimens.getProportionalScreenWidth(context, 24),
                height: Dimens.getProportionalScreenWidth(context, 24),
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
        color: context.theme.colorScheme.primary,
      ),
      text: Text(
        text,
        style: TextStyle(
          color: isPilled ? context.theme.colorScheme.onPrimary : context.theme.colorScheme.onBackground,
          fontSize: Dimens.getProportionalScreenWidth(context, 12),
        ),
      ),
    );
  }
}
