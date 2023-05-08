import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/bloc/lesson_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/widgets/remove_report_schedule_dialog.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_tutor_information.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class LessonInformation extends StatelessWidget {
  const LessonInformation({super.key});

  void showReportScheduleDialog(BuildContext contextCubit) {
    showDialog(
      context: contextCubit,
      builder: (context) {
        final bookingInfo = contextCubit.read<LessonInformationCubit>()
            .state.groupedBookingInfo.bookingInfoList?.first;
        final startTimestamp = bookingInfo?.scheduleDetailInfo?.startPeriodTimestamp;
        final endTimestamp = bookingInfo?.scheduleDetailInfo?.endPeriodTimestamp;

        final startTime = DateTime.fromMillisecondsSinceEpoch(startTimestamp ?? 0, isUtc: true).toLocal();
        final dateSession = startTimestamp != null
            ? DateFormat(AppDateFormats.eeeMMMdyyyy).format(startTime)
            : '__';
        final startTimeString = startTimestamp != null
            ? DateFormat(AppDateFormats.tHHmm).format(startTime)
            : '__';
        final endTimeString = endTimestamp != null
            ? DateFormat(AppDateFormats.tHHmm).format(
          DateTime.fromMillisecondsSinceEpoch(endTimestamp, isUtc: true).toLocal(),
        )
            : '__';
        return RemoveReportScheduleDialog(
          dropdownTitle: S.current.reasonReportQuestion,
          tutorAva: contextCubit.read<LessonInformationCubit>().state.groupedBookingInfo.tutorInfo?.avatar ?? '',
          tutorName: contextCubit.read<LessonInformationCubit>().state.groupedBookingInfo.tutorInfo?.name ?? '',
          dateTimeString: '$dateSession, $startTimeString - $endTimeString',
          dropDownData: MapConstants.reportScheduleReasons,
          onEditButtonTap: (reasonId, note) async {
            await Future.delayed(const Duration(seconds: 1), () async {
              await contextCubit.read<LessonInformationCubit>().reportBooking(
                bookingInfo?.id ?? '', reasonId, note,
              );
            });
          },
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonInformationCubit, LessonInformationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // tutor information
            SimpleTutorInformation(
              tutorInfo: state.groupedBookingInfo.tutorInfo,
              avatarSize: Dimens.getScreenWidth(context) * 0.2,
            ),
            const EmptyProportionalSpace(height: 20),

            // schedule information
            ...buildScheduleInformation(
              context: context,
              startTime: state.groupedBookingInfo.startTimestamp ?? DateTime.now(),
              endTime: state.groupedBookingInfo.endTimestamp ?? DateTime.now(),
            ),
            const EmptyProportionalSpace(height: 20),

            // button set
            buildButtonSet(context),
            const EmptyProportionalSpace(height: 25),

            // request field
            ...buildRequest(context, state.groupedBookingInfo.requestList.join('\n').trim()),
            const EmptyProportionalSpace(height: 15),
          ],
        );
      }
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
              onTap: () {
                showReportScheduleDialog(context);
              }
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
    Function()? onTap,
  }) {
    const iconSize = 16.0, verticalSpace = 4.0, buttonVerticalPadding = 7.0;
    const fontSize = 12.0, fontWeight = FontWeight.w600;

    return Flexible(
      child: PrimaryOutlineButton(
        borderRadiusValue: Dimens.getScreenWidth(context),
        paddingVertical: Dimens.getProportionalHeight(
          context, buttonVerticalPadding,
        ),
        onTap: onTap,
        preferGradient: false,
        borderColor: context.theme.colorScheme.onSurfaceVariant,
        bodyColor: context.theme.colorScheme.background,
        child: Column(
          children: [
            Icon(
              icon,
              color: context.theme.colorScheme.onSurfaceVariant,
              size: Dimens.getProportionalWidth(context, iconSize),
            ),
            const EmptyProportionalSpace(height: verticalSpace),
            Text(
              label,
              style: Dimens.getProportionalFont(
                context, context.theme.textTheme.bodyMedium,
              ).copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
                fontWeight: fontWeight,
                fontSize: Dimens.getProportionalWidth(context, fontSize),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildScheduleInformation({
    required BuildContext context,
    required DateTime startTime,
    required DateTime endTime,
  }) {
    final dateString = DateFormat(AppDateFormats.eeeMMMdyyyy).format(startTime);
    final startTimeString = DateFormat(AppDateFormats.tHHmm).format(startTime);
    final endTimeString = DateFormat(AppDateFormats.tHHmm).format(endTime);
    return [
      Text(
        dateString,
        textAlign: TextAlign.center,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.headlineSmall).copyWith(
          fontSize: Dimens.getProportionalWidth(context, 21),
        ),
      ),
      const EmptyProportionalSpace(height: 10),
      RowIconTextInformation(
        context: context,
        icon: Icon(
          Icons.access_time_rounded,
          size: Dimens.getProportionalWidth(context, 23),
          color: context.theme.colorScheme.primary,
        ),
        text: Text(
          '$startTimeString - $endTimeString',
          style: Dimens.getProportionalFont(
            context, context.theme.textTheme.bodyMedium,
          ).copyWith(
            color: context.theme.colorScheme.primary,
            fontSize: Dimens.getProportionalWidth(context, 20),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
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
        size: Dimens.getProportionalWidth(context, 23),
        color: context.theme.colorScheme.primary,
      ),
      text: Text(
        text,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          color: context.theme.colorScheme.primary,
          fontSize: Dimens.getProportionalWidth(context, 20),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.titleMedium).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 22),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  List<Widget> buildRequest(BuildContext context, String request) {
    return [
      Text(
        S.current.requestForClass,
        style: Dimens.getProportionalFont(
          context, context.theme.textTheme.titleMedium,
        ).copyWith(
          fontSize: Dimens.getProportionalWidth(context, 22),
          fontWeight: FontWeight.w600,
        ),
      ),
      const EmptyProportionalSpace(height: 7),
      Text(
        request.isEmpty ? S.current.noRequest : request,
        style: Dimens.getProportionalFont(
          context, context.theme.textTheme.bodyMedium,
        ).copyWith(
          fontSize: Dimens.getProportionalWidth(context, 14),
          fontWeight: FontWeight.w400,
        ),
      ),
    ];
  }
}
