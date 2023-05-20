import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/widgets/edit_student_request_dialog.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/popup_dialogs/remove_report_rating_schedule_dialog.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/widgets/upcoming_class_card.dart';
import 'package:one_one_learn/presentations/screens/video_call/video_call_screen.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/others/expandable_widget.dart';
import 'package:one_one_learn/presentations/widgets/others/list_empty_widget.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ListUpcoming extends StatelessWidget {
  const ListUpcoming({super.key});

  void showEditRequestDialog(BuildContext contextCubit, {
    required String bookingInfoId,
    required String currentNote,
  }) {
    showDialog(
      context: contextCubit,
      barrierDismissible: false,
      builder: (context) {
        return EditStudentRequestDialog(
          currentRequest: currentNote,
          onEditButtonTap: (note) async {
            await Future.delayed(const Duration(seconds: 1), () async {
              await contextCubit.read<UpcomingCubit>().editStudentRequestForBookingInfo(
                bookingInfoId, note,
              );
            });
          },
        );
      },
    );
  }

  void showCancelDialog(BuildContext contextCubit, {
    required String bookingInfoId,
    TutorInfo? tutorInfo,
    required String dateSession,
  }) {
    showDialog(
      context: contextCubit,
      barrierDismissible: false,
      builder: (context) {
        return RemoveReportRatingScheduleDialog(
          dropdownTitle: S.current.reasonCancelQuestion,
          tutorAva: tutorInfo?.avatar ?? '',
          tutorName: tutorInfo?.name ?? '',
          dateTimeString: dateSession,
          dropDownData: MapConstants.removeScheduleReasons,
          submitBtnText: S.current.confirmCancel,
          onEditButtonTap: (reasonId, note) async {
            await Future.delayed(const Duration(seconds: 1), () async {
              await contextCubit.read<UpcomingCubit>().cancelScheduleDetail(
                bookingInfoId, reasonId, note,
              );
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: (contextCubit, state) {
        final listGrouped = <GroupedBookingInfo?>[...state.groupedBookingInfoList];

        if (listGrouped.isEmpty) {
          return ListEmptyWidget(
            type: EmptyImageType.empty,
            text: S.current.noUpcomingSession,
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: listGrouped.length,
          itemBuilder: (context, index) {
            final item = listGrouped[index];

            if (item == null) {
              if (index == listGrouped.length - 3 && !state.isLoadingMore) {
                if (kDebugMode) {
                  print('call api to get more courses at index: $index and nextPage is: ${state.nextPage}');
                }
                contextCubit.read<UpcomingCubit>().getListStudentBookedClasses();
              }
              return UpcomingClassCard(
                margin: EdgeInsets.only(
                  left: Dimens.getProportionalWidth(context, 14),
                  right: Dimens.getProportionalWidth(context, 14),
                  bottom: Dimens.getProportionalHeight(context, 15),
                ),
                isLoading: true,
                firstChild: const AppFadeShimmer(radius: AppStyles.defaultCardBorderRadiusValue),
                tutorName: 'tutorName',
              );
            }

            return buildExpandableCard(
              contextCubit, item, index,
              isLast: index == listGrouped.length - 1,
              isJoining: state.isJoiningASession,
              bgColor: contextCubit.theme.colorScheme.surface,
            );
          },
        );
      },
    );
  }

  Widget buildExpandableCard(BuildContext context, GroupedBookingInfo item, int index, {
    bool isLast = false, bool isJoining = false, required Color bgColor,
  }) {
    final horizontalPadding = Dimens.getProportionalWidth(context, 14);
    final bottomPadding = Dimens.getProportionalHeight(context, 10);
    final request = item.requestList.join('\n');
    final listBookingInfo = item.bookingInfoList ?? <BookingInfo?>[];
    final marginPadding = EdgeInsets.only(
      left: horizontalPadding,
      right: horizontalPadding,
      bottom: isLast
          ? Dimens.getScreenWidth(context) * AppStyles.floatingActionButtonSizePercentage / 1.75
          : bottomPadding,
    );

    return ExpandableWidget(
      margin: marginPadding,
      childrenPadding: marginPadding,
      initialExpandedState: item.isExpanded,
      headerBodyDistance: 20,
      headerBodyDistanceAffectOutsideWidget: false,
      duration: 500,
      controlIconIndex: 0,
      autoChangeWidgetOnTap: false,
      header: UpcomingClassCard(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
          color: bgColor,
        ),
        firstChild: ClipRRect(
          borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
          child: SimpleNetworkImage(
            url: item.tutorInfo?.avatar,
          ),
        ),
        isExpand: item.isExpanded,
        canJoin: !isJoining && index == 0,
        crossAxisAlignment: CrossAxisAlignment.center,
        tutorName: item.tutorInfo?.name ?? '',
        lessonDateTime: item.startTimestamp,
        lessonEndTime: item.endTimestamp,
        onExpandCollapseButtonTap: () {
          context.read<UpcomingCubit>().toggleExpandCollapse(index);
        },
        onJoinButtonTap: () {
          Navigator.of(context).pushNamed(
            RouteNames.videoCall,
            arguments: VideoCallArguments(
              bookingInfo: item.bookingInfoList?.first,
            ),
          );
        },
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutralBlue200),
        borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
        color: bgColor,
        boxShadow: [
          Effects.normalShadowXS,
        ],
      ),
      children: [
        buildListSessionRow(context, listBookingInfo),
        const EmptyProportionalSpace(height: 20),
        buildRequestRow(context,listBookingInfo[0]?.id ?? '', request),
      ],
    );
  }

  Widget buildListSessionRow(BuildContext context, List<BookingInfo?> listBookingInfo) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: Dimens.getScreenHeight(context) * 0.17,
      ),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          return true;
        },
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: listBookingInfo.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                bottom: Dimens.getProportionalHeight(
                  context, index == listBookingInfo.length - 1 ? 0 : 10,
                ),
              ),
              child: buildSessionRow(
                context, bookingInfo: listBookingInfo[index],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSessionRow(BuildContext context, {
    BookingInfo? bookingInfo,
  }) {
    final startTimestamp = bookingInfo?.scheduleDetailInfo?.startPeriodTimestamp;
    final endTimestamp = bookingInfo?.scheduleDetailInfo?.endPeriodTimestamp;

    final startTime = DateTime.fromMillisecondsSinceEpoch(startTimestamp ?? 0, isUtc: true).toLocal();
    final differenceTime = startTime.difference(DateTime.now());
    final showCancelButton = differenceTime.inMilliseconds > 2 * 3600 * 1000;

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

    return Row(
      children: [
        Expanded(
          child: Text(
            '$startTimeString - $endTimeString',
          ),
        ),
        if (showCancelButton)
          PrimaryOutlineButton(
            onTap: () {
              showCancelDialog(
                context,
                bookingInfoId: bookingInfo?.id ?? '',
                tutorInfo: bookingInfo?.scheduleDetailInfo?.scheduleInfo?.tutorInfo,
                dateSession: '$dateSession, $startTimeString - $endTimeString',
              );
            },
            preferGradient: false,
            width: Dimens.getScreenWidth(context) * 0.2,
            paddingVertical: Dimens.getProportionalHeight(context, 8),
            bodyColor: context.theme.colorScheme.tertiaryContainer,
            borderColor: context.theme.colorScheme.onErrorContainer,
            splashColor: context.theme.colorScheme.errorContainer,
            highlightColor: context.theme.colorScheme.errorContainer,
            child: Text(
              S.current.cancel,
              style: Dimens.getProportionalFont(
                  context, context.theme.textTheme.titleSmall?.copyWith(
                fontSize: 14,
                color: context.theme.colorScheme.onErrorContainer,
              )),
            ),
          ),
      ],
    );
  }

  Widget buildRequestRow(BuildContext context, String firstBookingInfoId, String request) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.requestForClass,
          style: Dimens.getProportionalFont(
            context, context.theme.textTheme.titleSmall,
          ).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 16),
            fontStyle: FontStyle.italic,
          ),
        ),
        const EmptyProportionalSpace(height: 7),
        Row(
          children: [
            Expanded(
              child: request.isEmpty
                  ? Text(
                S.current.noRequest,
                style: Dimens.getProportionalFont(
                  context, context.theme.textTheme.bodySmall,
                ).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, 17),
                  fontStyle: FontStyle.italic,
                ),
              )
                  : Container(
                  constraints: BoxConstraints(
                    minHeight: Dimens.getScreenHeight(context) * 0.15,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.getProportionalWidth(context, 12),
                    vertical: Dimens.getProportionalHeight(context, 10),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.neutralBlue200),
                      borderRadius: BorderRadius.circular(15),
                      color: context.theme.colorScheme.tertiaryContainer
                  ),
                  child: Text(
                    request,
                    softWrap: true,
                    style: Dimens.getProportionalFont(
                      context,
                      context.theme.textTheme.bodySmall?.copyWith(
                        fontSize: Dimens.getProportionalWidth(context, 16),
                        color: context.theme.colorScheme.onBackground,
                      ),
                    ),
                  )
              ),
            ),
            const EmptyProportionalSpace(width: 10),
            PrimaryFillButton(
              onTap: () {
                showEditRequestDialog(
                  context,
                  bookingInfoId: firstBookingInfoId,
                  currentNote: request.split('\n')[0],
                );
              },
              hasShadow: false,
              preferGradient: false,
              width: Dimens.getScreenWidth(context) * 0.2,
              paddingVertical: Dimens.getProportionalHeight(context, 8),
              child: Text(
                S.current.edit,
                style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.titleSmall?.copyWith(
                  fontSize: 14,
                  color: context.theme.colorScheme.onPrimary,
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
