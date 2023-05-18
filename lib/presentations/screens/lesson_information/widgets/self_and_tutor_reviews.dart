import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/core/models/responses/feedback/feed_back.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/bloc/lesson_information_cubit.dart';
import 'package:one_one_learn/presentations/widgets/others/expandable_widget.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class SelfAndTutorReviews extends StatefulWidget {
  const SelfAndTutorReviews({super.key});

  @override
  State<SelfAndTutorReviews> createState() => _SelfAndTutorReviewsState();
}

class _SelfAndTutorReviewsState extends State<SelfAndTutorReviews> {
  var selfReviewInitialExpanded = true;
  var tutorReviewInitialExpanded = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonInformationCubit, LessonInformationState>(
      builder: (context, state) {
        final listFeedback = state.groupedBookingInfo.feedbackList;
        final numberOfFeedback = listFeedback.length;
        final listBookingInfo = state.groupedBookingInfo.bookingInfoList ?? <BookingInfo>[];
        final numberSession = state.groupedBookingInfo.bookingInfoList?.length ?? 0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // self reviews
            if (state.groupedBookingInfo.feedbackList.isEmpty)
              buildNoSelfReviewOrNoTutorReview(context, isNoSelfReview: true)
            else buildSelfReviewOrTutorReview(
              context,
              isSelfReview: true,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: Dimens.getScreenHeight(context) * 0.25,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: numberOfFeedback,
                    itemBuilder: (context, index) {
                      final feedback = listFeedback[index];
                      return buildSingleSelfReviewItem(
                        context, feedback , isLast: index == numberOfFeedback - 1,
                      );
                    },
                  ),
                ),
              ],
            ),

            const EmptyProportionalSpace(height: 15),

            // tutor reviews
            if (!state.groupedBookingInfo.isReviewed)
              buildNoSelfReviewOrNoTutorReview(context)
            else buildSelfReviewOrTutorReview(
                context,
                children: [
                  for (var i = 0; i < numberSession; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...buildSingleTutorReviewItem(
                          context,
                          index: i,
                          bookingInfo: listBookingInfo[i],),
                        const EmptyProportionalSpace(height: 30),
                      ],
                    ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget buildSelfReviewOrTutorReview(BuildContext context, {
    bool isSelfReview = false, required List<Widget> children,
  }) {
    return ExpandableWidget(
      mainAxisSize: MainAxisSize.min,
      onExpansionChanged: (isExpanded) {
        if (isSelfReview) {
          selfReviewInitialExpanded = isExpanded;
        } else {
          tutorReviewInitialExpanded = isExpanded;
        }
      },
      headerBodyDistanceAffectOutsideWidget: false,
      initialExpandedState: isSelfReview ? selfReviewInitialExpanded : tutorReviewInitialExpanded,
      header: buildHeader(isSelfReview ? S.current.yourReview : S.current.tutorReview),
      trailingIcon: Icon(
        Icons.arrow_forward_ios_rounded,
        size: Dimens.getProportionalWidth(context, 24),
        color: context.theme.colorScheme.onBackground,
      ),
      children: children,
    );
  }

  Widget buildHeader(String title) {
    return Text(
      title,
      style: Dimens.getProportionalFont(
        context, context.theme.textTheme.titleMedium,
      ).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 22),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildSubHeader(BuildContext context, String subheading) {
    return Text(
      subheading,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 17),
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget buildNoSelfReviewOrNoTutorReview(BuildContext context, {
    bool isNoSelfReview = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(isNoSelfReview ? S.current.haveNotReviewed : S.current.tutorReview),
        const EmptyProportionalSpace(height: 7),
        Text(
          S.current.isNotReviewed,
          style: Dimens.getProportionalFont(
            context, context.theme.textTheme.bodyMedium,
          ).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildSingleSelfReviewItem(BuildContext context, FeedBack feedback, {
    bool isLast = false,
  }) {
    const insideDistance = 7.0;
    final ratingTime = DateTime.tryParse(feedback.createdAt ?? '')?.toLocal();
    final ratingDate = ratingTime != null
        ? DateFormat(AppDateFormats.eeeMMMdyyyy).format(ratingTime)
        : '__';
    final ratingCreatedAt = ratingTime != null
        ? DateFormat(AppDateFormats.tHHmm).format(ratingTime)
        : '__';
    final rating = feedback.rating ?? 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // review time
        Text(
          '$ratingDate, $ratingCreatedAt',
          style: Dimens.getProportionalFont(context, context.theme.textTheme.titleLarge).copyWith(
            fontWeight: FontWeight.w600,
            color: context.theme.colorScheme.onInverseSurface,
          ),
        ),
        const EmptyProportionalSpace(height: insideDistance + 3),

        // rating
        Row(
          children: [
            buildSubHeader(context, '${S.current.rating}: '),
            buildRowIconTextInformation(
              context,
              Icon(
                Icons.star_rounded,
                size: Dimens.getProportionalWidth(context, 15),
              ),
              '$rating/5',
            ),
          ],
        ),
        const EmptyProportionalSpace(height: insideDistance),

        // comment
        buildReviewInformation(
          context,
          subheading: S.current.content,
          text: feedback.content ?? '',
        ),
        if (!isLast) const EmptyProportionalSpace(height: 30),
      ],
    );
  }

  List<Widget> buildSingleTutorReviewItem(BuildContext context, {
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
        buildNoSelfReviewOrNoTutorReview(context)
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

  Widget buildReviewInformation(BuildContext context, {
    required String subheading,
    String? text,
    String? extraText,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildSubHeader(context, subheading + (extraText != null ? ' ' : ': ')),
        if (extraText != null) ...[
          buildRowIconTextInformation(
            context,
            Icon(
              Icons.stars_rounded,
              color: context.theme.colorScheme.primary,
              size: Dimens.getProportionalWidth(context, 15),
            ),
            extraText,
          ),
          Text(
            ': ',
            style: Dimens.getProportionalFont(
              context, context.theme.textTheme.bodyMedium,
            ).copyWith(
              fontSize: Dimens.getProportionalWidth(context, 17),
            ),
          ),
        ],
        if (text != null && text.isNotEmpty)
          Flexible(child: buildTextContent(context, text)),
      ],
    );
  }

  Widget buildRowIconTextInformation(BuildContext context, Icon icon, String text) {
    return RowIconTextInformation(
      context: context,
      betweenSpace: Dimens.getProportionalWidth(context, 1),
      icon: icon,
      text: Text(
        text,
        style: Dimens.getProportionalFont(
          context, context.theme.textTheme.bodyMedium,
        ).copyWith(
          color: context.theme.colorScheme.primary,
          fontSize: Dimens.getProportionalWidth(context, 17),
        ),
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content) {
    return Text(
      content,
      style: Dimens.getProportionalFont(
        context, context.theme.textTheme.bodyMedium,
      ).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 17),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
