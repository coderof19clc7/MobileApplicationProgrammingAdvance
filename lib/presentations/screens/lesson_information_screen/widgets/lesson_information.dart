import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/box_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class LessonInformation extends StatelessWidget {
  const LessonInformation({super.key});

  @override
  Widget build(BuildContext context) {
    const lessonDateFormat = 'EEE, MMM d, yyyy';
    const lessonTimeFormat = 'HH:mm';

    final time = DateTime.now().add(
      Duration(
        days: Random().nextInt(5),
        hours: Random().nextInt(5),
        minutes: Random().nextInt(5),
      ),
    );
    final endTime = time.add(const Duration(hours: 2));

    final lessonStartTime = DateFormat(lessonTimeFormat).format(time);
    final lessonEndTime = DateFormat(lessonTimeFormat).format(endTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // tutor information
        buildTutorInformation(context),
        const EmptyProportionalSpace(height: 20),
        // schedule information
        buildScheduleInformation(
          context: context,
          time: time,
          dateFormat: lessonDateFormat,
          startTime: lessonStartTime,
          endTime: lessonEndTime,
        ),
        const EmptyProportionalSpace(height: 20),
        // button set
        buildButtonSet(context),
        const EmptyProportionalSpace(height: 25),
        // request field
        buildTitle(context, S.current.requestForClass),
        const EmptyProportionalSpace(height: 15),
        buildTextContent(
          context,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat. Suspendissepotenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci. Mauris ac ex viverra, facilisis augue sit amet, sollicitudin dolor.',
        ),
        const EmptyProportionalSpace(height: 15),
        // learned book field
        buildTitle(context, S.current.learnedBook),
        const EmptyProportionalSpace(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [Expanded(child: BoxButton(title: 'Career Path Unit 5', circleText: '0', onTap: () {}))],
            ),
          ],
        ),
        const EmptyProportionalSpace(height: 15),
        // tutor's review
        buildTitle(context, S.current.tutorReview),
        const EmptyProportionalSpace(height: 15),
        // lesson status field
        buildReviewInformation(
          context,
          subheading: S.current.lessonStatus,
          text: 'The student was absent.',
        ),
        // behavior field
        buildReviewInformation(
          context,
          subheading: S.current.behavior,
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat. Suspendissepotenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci.',
          extraText: '4/5',
        ),
        // listening field
        buildReviewInformation(
          context,
          subheading: S.current.listening,
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat.',
          extraText: '4/5',
        ),
        // speaking field
        buildReviewInformation(
          context,
          subheading: S.current.speaking,
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          extraText: '4/5',
        ),
        // vocabulary field
        buildReviewInformation(
          context,
          subheading: S.current.speaking,
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod.',
          extraText: '4/5',
        ),
        // overall field
        buildReviewInformation(
          context,
          subheading: S.current.overallComment,
          text:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat.',
        ),
        // homework field
        buildReviewInformation(
          context,
          subheading: S.current.homework,
          text: 'Maecenas vitae faucibus erat.',
        ),
        const EmptyProportionalSpace(height: 30),
      ],
    );
  }

  Widget buildReviewInformation(
    BuildContext context, {
    required String subheading,
    String? text,
    String? extraText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildSubheading(
          context,
          subheading,
          extraInformation: extraText != null ? buildRowIconTextInformation(context, extraText) : null,
        ),
        if (text != null && text.isNotEmpty) const EmptyProportionalSpace(height: 10),
        if (text != null && text.isNotEmpty) buildTextContent(context, text),
        const EmptyProportionalSpace(height: 15),
      ],
    );
  }

  RowIconTextInformation buildRowIconTextInformation(BuildContext context, String text) {
    return RowIconTextInformation(
      context: context,
      icon: Icon(
        Icons.stars_rounded,
        color: context.theme.colorScheme.primary,
        size: Dimens.getProportionalScreenWidth(context, 15),
      ),
      text: Text(
        text,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          color: context.theme.colorScheme.primary,
          fontSize: Dimens.getProportionalScreenWidth(context, 17),
        ),
      ),
    );
  }

  Widget buildButtonSet(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButton(
              context: context,
              icon: Icons.report_rounded,
              label: S.current.report,
            ),
            const EmptyProportionalSpace(width: 7),
            buildButton(
              context: context,
              icon: Icons.chat_rounded,
              label: S.current.chat,
            ),
            const EmptyProportionalSpace(width: 7),
            buildButton(
              context: context,
              icon: Icons.missed_video_call_rounded,
              label: S.current.record,
            ),
            const EmptyProportionalSpace(width: 7),
            buildButton(
              context: context,
              icon: Icons.rate_review_rounded,
              label: S.current.review,
            ),
          ],
        )
      ],
    );
  }

  Widget buildButton({
    required BuildContext context,
    required IconData icon,
    required String label,
  }) {
    const iconSize = 16.0, verticalSpace = 4.0, buttonVerticalPadding = 7.0;
    const fontSize = 12.0, fontWeight = FontWeight.w600;

    return Flexible(
      child: PrimaryOutlineButton(
        borderRadiusValue: Dimens.getScreenWidth(context),
        paddingVertical: Dimens.getProportionalScreenHeight(
          context,
          buttonVerticalPadding,
        ),
        onTap: () {},
        preferGradient: false,
        borderColor: context.theme.colorScheme.onSurfaceVariant,
        bodyColor: context.theme.colorScheme.background,
        child: Column(
          children: [
            Icon(
              icon,
              color: context.theme.colorScheme.onSurfaceVariant,
              size: Dimens.getProportionalScreenWidth(
                context,
                iconSize,
              ),
            ),
            const EmptyProportionalSpace(height: verticalSpace),
            Text(
              label,
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
                fontWeight: fontWeight,
                fontSize: Dimens.getProportionalScreenWidth(
                  context,
                  fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScheduleInformation({
    required BuildContext context,
    required DateTime time,
    required String dateFormat,
    required String startTime,
    required String endTime,
  }) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat(dateFormat).format(time),
              textAlign: TextAlign.center,
              style: Dimens.getProportionalFont(context, context.theme.textTheme.headlineSmall).copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 21),
              ),
            ),
            const EmptyProportionalSpace(height: 10),
            buildScheduleTime(
              context: context,
              icon: Icons.access_time_rounded,
              text: '$startTime - $endTime',
            ),
          ],
        )
      ],
    );
  }

  Widget buildTutorInformation(BuildContext context) {
    return Row(
      children: [
        // avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(
            Dimens.getScreenWidth(context) * 0.1820512,
          ),
          child: Image.network(
            'https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00',
            width: Dimens.getScreenWidth(context) * 0.1820512,
            height: Dimens.getScreenWidth(context) * 0.1820512,
            fit: BoxFit.cover,
          ),
        ),
        const EmptyProportionalSpace(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name
            Text(
              'Haylee Caillier',
              textAlign: TextAlign.center,
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 16),
                fontWeight: FontWeight.w500,
              ),
            ),
            const EmptyProportionalSpace(height: 10),
            // nationality
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  UIHelper.getIconFromNationalityCode('DE'),
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    fontSize: Dimens.getProportionalScreenWidth(context, 16),
                  ),
                ),
                const EmptyProportionalSpace(width: 8),
                Text(
                  'Netherlands',
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    fontSize: Dimens.getProportionalScreenWidth(context, 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildScheduleTime({
    required BuildContext context,
    required IconData icon,
    required String text,
  }) {
    return RowIconTextInformation(
      context: context,
      icon: Icon(
        icon,
        size: Dimens.getProportionalScreenWidth(context, 23),
        color: context.theme.colorScheme.primary,
      ),
      text: Text(
        text,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          color: context.theme.colorScheme.primary,
          fontSize: Dimens.getProportionalScreenWidth(context, 20),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.titleMedium).copyWith(
        fontSize: Dimens.getProportionalScreenWidth(context, 22),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content) {
    return Text(
      content,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontSize: Dimens.getProportionalScreenWidth(context, 14),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget buildSubheading(
    BuildContext context,
    String subheading, {
    Widget? extraInformation,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          subheading,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.titleMedium).copyWith(
            fontSize: Dimens.getProportionalScreenWidth(context, 17),
            fontWeight: FontWeight.w600,
          ),
        ),
        const EmptyProportionalSpace(width: 10),
        extraInformation != null ? Flexible(child: extraInformation) : const SizedBox.shrink(),
      ],
    );
  }
}
