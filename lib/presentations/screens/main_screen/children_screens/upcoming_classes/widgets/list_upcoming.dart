import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/booking_info.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/widgets/upcoming_class_card.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/others/expandable_widget.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ListUpcoming extends StatelessWidget {
  const ListUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: (context, state) {
        final listGrouped = <GroupedBookingInfo?>[...state.groupedBookingInfoList];

        if (listGrouped.isEmpty) {
          return const Center(
            child: Text('Nothing here'),
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
                context.read<UpcomingCubit>().getListStudentBookedClasses();
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
                buttonLabel: 'buttonLabel',
              );
            }

            return buildExpandableCard(context, item, index, isLast: index == listGrouped.length - 1);
          },
        );
      },
    );
  }

  Widget buildExpandableCard(BuildContext context, GroupedBookingInfo item, int index, {
    bool isLast = false,
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
          color: context.theme.colorScheme.surface,
        ),
        firstChild: ClipRRect(
          borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
          child: SimpleNetworkImage(
            url: item.tutorInfo?.avatar,
          ),
        ),
        isExpand: item.isExpanded,
        crossAxisAlignment: CrossAxisAlignment.center,
        tutorName: item.tutorInfo?.name ?? '',
        buttonLabel: S.current.enterRoom,
        lessonDateTime: item.startTimestamp,
        lessonEndTime: item.endTimestamp,
        onExpandCollapseButtonTap: () {
          context.read<UpcomingCubit>().toggleExpandCollapse(index);
        },
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutralBlue200),
        borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
        color: context.theme.colorScheme.surface,
        boxShadow: [
          Effects.normalShadowXS,
        ],
      ),
      children: [
        buildListSessionRow(context, listBookingInfo),
        const EmptyProportionalSpace(height: 20),
        buildRequestRow(context, request),
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
            final bookingInfo = listBookingInfo[index];
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
            return Container(
              margin: EdgeInsets.only(
                bottom: Dimens.getProportionalHeight(
                  context, index == listBookingInfo.length - 1 ? 0 : 10,
                ),
              ),
              child: buildSessionRow(
                context,
                startTimeString: startTimeString,
                endTimeString: endTimeString,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildSessionRow(BuildContext context, {
    required String startTimeString,
    required String endTimeString,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$startTimeString - $endTimeString',
          ),
        ),
        PrimaryOutlineButton(
          onTap: () {

          },
          preferGradient: false,
          width: Dimens.getScreenWidth(context) * 0.2,
          paddingVertical: Dimens.getProportionalHeight(context, 8),
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

  Widget buildRequestRow(BuildContext context, String request) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.requestForClass,
          style: Dimens.getProportionalFont(
            context, context.theme.textTheme.titleSmall,
          ).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 16),
            color: context.theme.colorScheme.onSurface,
            fontStyle: FontStyle.italic,
          ),
        ),
        const EmptyProportionalSpace(height: 7),
        Row(
          children: [
            Expanded(
              child: Container(
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
                  color: context.theme.colorScheme.background
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
