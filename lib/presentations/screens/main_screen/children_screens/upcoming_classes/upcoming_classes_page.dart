
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/widgets/list_upcoming.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/widgets/total_lesson_time_banner.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class UpcomingClassesPage extends StatefulWidget {
  const UpcomingClassesPage({super.key});

  @override
  State<UpcomingClassesPage> createState() => _UpcomingClassesPageState();
}

class _UpcomingClassesPageState extends State<UpcomingClassesPage>
    with AutomaticKeepAliveClientMixin<UpcomingClassesPage> {
  var tempList = [
    'Raymond Sanft',
    'Haylee Caillier',
    'Danny Seipel',
    'Rodney Francis',
    'Phillips Seine',
    'Johnny Lains',
    'Heinrich Grey',
    'Lemund Eddie',
    'Pellins Wellfone',
    'Boris Frank'
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: SizedBox(
        width: Dimens.getScreenWidth(context),
        height: Dimens.getScreenHeight(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // total lesson time
            BlocBuilder<UpcomingCubit, UpcomingState>(
              builder: (context, state) {
                final learned = state.totalCall > 0;
                final fontSize = learned ? 24.0 : 20.0;
                var text = S.current.haveNotLearnAnyLesson;
                if (learned) {
                  final hour = state.totalCall ~/ 60;
                  final minute = state.totalCall % 60;
                  text = '$hour ${S.current.hours} $minute ${S.current.minutes}';
                }
                return TotalLessonTimeBanner(
                  isLoading: state.isLoadingTotalCall,
                  showLabel: learned,
                  width: Dimens.getScreenWidth(context),
                  topLabel: S.current.labelTotalLessonTime,
                  topContentWidget: Text(
                    text, textAlign: TextAlign.center,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyMedium,
                    ).copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Dimens.getProportionalWidth(context, fontSize),
                    ),
                  ),
                  buttonLabel: S.current.lessonHistory,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.lessonHistory);
                  },
                );
              },
            ),

            // swipe hint
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getScreenWidth(context) * 0.03,
                vertical: Dimens.getScreenHeight(context) * 0.009,
              ),
              child: RowIconTextInformation(
                context: context,
                icon: Icon(
                  Icons.info_outline_rounded,
                  color: context.theme.colorScheme.onInverseSurface,
                  size: Dimens.getProportionalWidth(context, 20),
                ),
                text: Text(
                  S.current.cancelClassHint,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                    fontSize: Dimens.getProportionalWidth(context, 14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const EmptyProportionalSpace(height: 10),
            // upcoming classes list
            const Expanded(child: ListUpcoming()),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
