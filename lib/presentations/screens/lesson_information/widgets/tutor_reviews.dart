import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/bloc/lesson_information_cubit.dart';
import 'package:one_one_learn/presentations/widgets/others/expandable_widget.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class TutorReviews extends StatelessWidget {
  const TutorReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonInformationCubit, LessonInformationState>(
      builder: (context, state) {
        final listBookingInfo = state.groupedBookingInfo.bookingInfoList ?? <BookingInfo>[];
        final numberSession = state.groupedBookingInfo.bookingInfoList?.length ?? 0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.tutorReview,
              style: Dimens.getProportionalFont(
                context, context.theme.textTheme.titleMedium,
              ).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 22),
                fontWeight: FontWeight.w600,
              ),
            ),
            const EmptyProportionalSpace(height: 7),
            if (!state.groupedBookingInfo.isReviewed)
              buildNoReview(context)
            else for (var i = 0; i < numberSession; i++)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...buildSingleReviewItem(context, index: i, bookingInfo: listBookingInfo[i]),
                  const EmptyProportionalSpace(height: 30),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget buildNoReview(BuildContext context) {
    return Text(
      S.current.isNotReviewed,
      style: Dimens.getProportionalFont(
        context, context.theme.textTheme.bodyMedium,
      ).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 14),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  List<Widget> buildSingleReviewItem(BuildContext context, {
    required int index, required BookingInfo? bookingInfo,
  }) {
    const insideDistance = 7.0;

    // prepare String data
    final startTime = bookingInfo?.scheduleDetailInfo?.startPeriodTimestamp ?? 0;
    final endTime = bookingInfo?.scheduleDetailInfo?.endPeriodTimestamp ?? 0;
    final startTimeString = bookingInfo != null
        ? DateFormat(AppDateFormats.tHHmm).format(
      DateTime.fromMillisecondsSinceEpoch(startTime, isUtc: true).toLocal(),
    )
        : '__';
    final endTimeString = bookingInfo != null
        ? DateFormat(AppDateFormats.tHHmm).format(
      DateTime.fromMillisecondsSinceEpoch(endTime, isUtc: true).toLocal(),
    )
        : '__';

    return [
      // session title
      Text(
        '${S.current.session} ${index + 1}: $startTimeString - $endTimeString',
        style: Dimens.getProportionalFont(context, context.theme.textTheme.titleLarge).copyWith(
          fontWeight: FontWeight.w600,
          color: context.theme.colorScheme.onInverseSurface,
        ),
      ),
      const EmptyProportionalSpace(height: insideDistance + 3),

      if (bookingInfo?.classReview == null) ...[
        buildNoReview(context)
      ]
      else ...[
        // lesson status
        buildReviewInformation(
          context,
          subheading: S.current.lessonStatus,
          text: bookingInfo?.classReview?.lessonStatus?.status,
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // behavior field
        buildReviewInformation(
          context,
          subheading: S.current.behavior,
          text: bookingInfo?.classReview?.behaviorComment,
          extraText: '${UIHelper.doubleToStringAsFixed((
              bookingInfo?.classReview?.behaviorRating ?? 0
          ).toDouble())}/5',
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // listening field
        buildReviewInformation(
          context,
          subheading: S.current.listening,
          text: bookingInfo?.classReview?.listeningComment,
          extraText: '${UIHelper.doubleToStringAsFixed((
              bookingInfo?.classReview?.listeningRating ?? 0
          ).toDouble())}/5',
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // speaking field
        buildReviewInformation(
          context,
          subheading: S.current.speaking,
          text: bookingInfo?.classReview?.speakingComment,
          extraText: '${UIHelper.doubleToStringAsFixed((
              bookingInfo?.classReview?.speakingRating ?? 0
          ).toDouble())}/5',
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // vocabulary field
        buildReviewInformation(
          context,
          subheading: S.current.vocabulary,
          text: bookingInfo?.classReview?.vocabularyComment,
          extraText: '${UIHelper.doubleToStringAsFixed((
              bookingInfo?.classReview?.vocabularyRating ?? 0
          ).toDouble())}/5',
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // homework field
        buildReviewInformation(
          context,
          subheading: S.current.homework,
          text: bookingInfo?.classReview?.homeworkComment,
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // overall field
        buildReviewInformation(
          context,
          subheading: S.current.overallComment,
          text: bookingInfo?.classReview?.overallComment,
        ),
      ],
    ];
  }

  Widget buildReviewInformation(
      BuildContext context, {
        required String subheading,
        String? text,
        String? extraText,
      }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subheading + (extraText != null ? ' ' : ': '),
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 17),
            fontStyle: FontStyle.italic,
          ),
        ),
        extraText != null
            ? buildRowIconTextInformation(context, extraText)
            : const SizedBox.shrink(),
        if (text != null && text.isNotEmpty)
          Flexible(child: buildTextContent(context, text)),
      ],
    );
  }

  Widget buildRowIconTextInformation(BuildContext context, String text) {
    return RowIconTextInformation(
      context: context,
      betweenSpace: Dimens.getProportionalWidth(context, 1),
      icon: Icon(
        Icons.stars_rounded,
        color: context.theme.colorScheme.primary,
        size: Dimens.getProportionalWidth(context, 15),
      ),
      text: Text(
        '$text: ',
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          color: context.theme.colorScheme.primary,
          fontSize: Dimens.getProportionalWidth(context, 17),
        ),
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content) {
    return Text(
      content,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 17),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Widget buildSingleReviewItem(BuildContext context, {
  //   bool isExpanded = false, required int index, required BookingInfo? bookingInfo,
  // }) {
  //   final paddingHorizontal = Dimens.getProportionalWidth(context, 7);
  //   final paddingVertical = Dimens.getProportionalWidth(context, 10);
  //
  //   // prepare String data
  //   final startTime = bookingInfo?.scheduleDetailInfo?.startPeriodTimestamp ?? 0;
  //   final endTime = bookingInfo?.scheduleDetailInfo?.endPeriodTimestamp ?? 0;
  //   final startTimeString = bookingInfo != null
  //       ? DateFormat(AppDateFormats.tHHmm).format(
  //     DateTime.fromMillisecondsSinceEpoch(startTime, isUtc: true).toLocal(),
  //   )
  //       : '__';
  //   final endTimeString = bookingInfo != null
  //       ? DateFormat(AppDateFormats.tHHmm).format(
  //     DateTime.fromMillisecondsSinceEpoch(endTime, isUtc: true).toLocal(),
  //   )
  //       : '__';
  //
  //
  //   return ExpandableWidget(
  //     initialExpandedState: isExpanded,
  //     autoChangeWidgetOnTap: false,
  //     headerPadding: EdgeInsets.symmetric(
  //       horizontal: paddingHorizontal,
  //       vertical: paddingVertical,
  //     ),
  //     childrenPadding: EdgeInsets.symmetric(
  //       horizontal: paddingHorizontal,
  //       vertical: paddingVertical,
  //     ),
  //     margin: EdgeInsets.only(bottom: paddingVertical),
  //     headerBodyDistance: 0,
  //     decoration: BoxDecoration(
  //       border: Border.all(color: context.theme.colorScheme.inverseSurface),
  //       borderRadius: BorderRadius.circular(
  //         Dimens.getProportionalWidth(context, 10),
  //       ),
  //       color: context.theme.colorScheme.inverseSurface,
  //     ),
  //     header: Text(
  //       '${S.current.lesson} ${index + 1}: $startTimeString - $endTimeString',
  //       style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
  //         fontWeight: FontWeight.w600,
  //         color: context.theme.colorScheme.onInverseSurface,
  //       ),
  //     ),
  //     children: [
  //
  //     ],
  //   );
  // }
}
