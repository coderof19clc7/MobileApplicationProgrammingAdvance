
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/lesson_history/bloc/histories_cubit.dart';
import 'package:one_one_learn/presentations/screens/lesson_history/widgets/lesson_history_card.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/lesson_information_screen.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/others/list_empty_widget.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';

class LessonHistoryPage extends StatelessWidget {
  const LessonHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Container(
        padding: EdgeInsets.only(
          bottom: Dimens.getBottomSafeAreaHeight(context) + 10,
        ),
        width: Dimens.getScreenWidth(context),
        height: Dimens.getScreenHeight(context),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HistoriesCubit, HistoriesState>(
                builder: (context, state) {
                  final listGrouped = <GroupedBookingInfo?>[...state.groupedHistoryBookingInfoList];

                  if (listGrouped.isEmpty) {
                    return ListEmptyWidget(
                      type: EmptyImageType.empty,
                      text: S.current.notFoundSomethings(S.current.haveNotLearnAnyLesson),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: listGrouped.length,
                    itemBuilder: (context, index) {
                      final item = listGrouped[index];

                      if (item == null) {
                        if (index == listGrouped.length - 3 && !state.isLoadingMore) {
                          if (kDebugMode) {
                            print('call api to get more courses at index: $index'
                                ' and nextPage is: ${state.nextPage}');
                          }
                          context.read<HistoriesCubit>().getListStudentHistories();
                        }
                        return LessonHistoryCard(
                          margin: EdgeInsets.only(
                            left: Dimens.getProportionalWidth(context, 14),
                            right: Dimens.getProportionalWidth(context, 14),
                            bottom: Dimens.getProportionalHeight(context, 15),
                          ),
                          isLoading: true,
                          firstChild: const AppFadeShimmer(
                            radius: AppStyles.defaultCardBorderRadiusValue,
                          ),
                          tutorName: 'tutorName',
                          buttonLabel: 'buttonLabel',
                          isReviewed: false,
                        );
                      }

                      // lesson history card
                      return LessonHistoryCard(
                        firstChild: ClipRRect(
                          borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
                          child: SimpleNetworkImage(
                            url: item.tutorInfo?.avatar,
                          ),
                        ),
                        tutorName: item.tutorInfo?.name ?? '',
                        lessonDateTime: item.startTimestamp,
                        lessonEndTime: item.endTimestamp,
                        isReviewed: item.isReviewed,
                        onButtonTap: () {
                          Navigator.pushNamed(
                            context, RouteNames.lessonInformation,
                            arguments: LessonInformationArgs(groupedBookingInfo: item),
                          );
                        },
                        buttonLabel: S.current.more,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        margin: EdgeInsets.only(
                          bottom: Dimens.getProportionalHeight(context, 15),
                          left: Dimens.getScreenWidth(context) * 0.03,
                          right: Dimens.getScreenWidth(context) * 0.03,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
