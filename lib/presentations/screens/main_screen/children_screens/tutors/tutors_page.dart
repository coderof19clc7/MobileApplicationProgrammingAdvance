import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/list_tutors.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/search_field.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/upcoming_class_banner.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/top_banner_tutors_upcoming.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/tutors_courses_search_field.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/bodies/tutors_courses_list_filter.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class TutorsPage extends StatelessWidget {
  const TutorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now().add(
      Duration(
        days: Random().nextInt(5),
        hours: Random().nextInt(5),
        minutes: Random().nextInt(5),
      ),
    );
    final endTime = startTime.add(const Duration(minutes: 55));

    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: Dimens.getScreenWidth(context),
          height: Dimens.getScreenHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // nearest upcoming class countdown
              BlocBuilder<UpcomingCubit, UpcomingState>(
                builder: (contextUpcoming, stateUpcoming) {
                  var hasUpcomingClass = stateUpcoming.groupedBookingInfoList.isNotEmpty;
                  GroupedBookingInfo? upcomingClass;
                  if (hasUpcomingClass) {
                    upcomingClass = stateUpcoming.groupedBookingInfoList.first;
                    if (upcomingClass == null) {
                      hasUpcomingClass = false;
                    }
                  }
                  return TopBannerTutorsUpcoming(
                    width: Dimens.getScreenWidth(context),
                    isLoading: stateUpcoming.isLoadingMore,
                    showLabel: stateUpcoming.isLoadingMore || hasUpcomingClass,
                    topLabel: S.current.labelUpcomingClass,
                    contentWidget: hasUpcomingClass
                        ? UpcomingClassBanner(
                      startTime: DateTime.fromMillisecondsSinceEpoch(
                        upcomingClass?.bookingInfoList?.first?.scheduleDetailInfo?.startPeriodTimestamp ?? 0,
                        isUtc: true,
                      ).toLocal(),
                      endTime: DateTime.fromMillisecondsSinceEpoch(
                        upcomingClass?.bookingInfoList?.first?.scheduleDetailInfo?.endPeriodTimestamp ?? 0,
                        isUtc: true,
                      ).toLocal(),
                      upcomingDateFormat: AppDateFormats.eeeMMMdyyyy,
                      upcomingTimeFormat: AppDateFormats.tHHmm,
                      onClassSessionEnded: () {
                        contextUpcoming.read<UpcomingCubit>().refreshUpcomingScreen();
                      },
                    )
                        : Text(
                      S.current.noUpcomingSession,
                      textAlign: TextAlign.center,
                      style: Dimens.getProportionalFont(
                        context, context.theme.textTheme.displaySmall,
                      ).copyWith(
                        fontSize: Dimens.getProportionalWidth(context, 20),
                      ),
                    ),
                    showButton: !stateUpcoming.isLoadingMore && hasUpcomingClass,
                    buttonLabel: S.current.enterRoom,
                    buttonIcon: Icon(
                      Icons.login_rounded,
                      color: context.theme.colorScheme.onSecondary,
                      size: Dimens.getProportionalWidth(context, 17),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.videoCall);
                    },
                  );
                },
              ),
              const EmptyProportionalSpace(height: 10),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.getScreenWidth(context) * 0.03,
                  ),
                  child: Column(
                    children: [
                      // search field
                      // SearchField(),
                      BlocBuilder<TutorsCubit, TutorsState>(
                        builder: (context, state) {
                          return TutorsCoursesSearchField(
                            hintText: S.current.searchHintTutor,
                            isLoadingMore: state.isLoadingMore,
                            listFilterBodyBottomSheet: TutorsCoursesListFilterBottomSheet(
                              label1: S.current.specialties,
                              label2: S.current.nationality,

                              // data1Map: context.read<TutorsCubit>().specialtiesMap.values.toList(),
                              // data1RenderValues: context.read<TutorsCubit>().specialtiesMap.keys.toList(),
                              data1Map: MapConstants.specialtiesMap,
                              data1CurrentFilter: context.read<TutorsCubit>().getCurrentSpecialties(),

                              // data2Map: context.read<TutorsCubit>().nationalitiesMap.values.toList(),
                              // data2RenderValues: context.read<TutorsCubit>().nationalitiesMap.keys.toList(),
                              data2Map: context.read<TutorsCubit>().nationalitiesMap,
                              data2CurrentFilter: context.read<TutorsCubit>().getCurrentNationalities(),

                              // data3Map: context.read<TutorsCubit>().sortMap.values.toList(),
                              // data3RenderValues: context.read<TutorsCubit>().sortMap.keys.toList(),
                              data3Map: context.read<TutorsCubit>().sortMap,
                              data3CurrentFilter: state.sortValue,

                              onApplyFilters: (data1, data2, data3) {
                                context.read<TutorsCubit>().onApplyFilters2(data1, data2, data3);
                              },
                            ),
                            onSubmitted: (value) {
                              context.read<TutorsCubit>().onSearchTextSubmitted2(value);
                            },
                          );
                        },
                      ),
                      const EmptyProportionalSpace(height: 30),
                      // tutors list
                      const Expanded(child: ListTutors()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
