import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/upcoming_classes/widgets/total_lesson_time_banner.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/upcoming_classes/widgets/upcoming_class_card.dart';
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
    final hour = Random().nextInt(12) + 1;
    final minute = Random().nextInt(45);

    return Scaffold(
      body: SizedBox(
        width: Dimens.getScreenWidth(context),
        height: Dimens.getScreenHeight(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // total lesson time
            TotalLessonTimeBanner(
              width: Dimens.getScreenWidth(context),
              topLabel: S.current.labelTotalLessonTime,
              totalTime: '$hour ${S.current.hours} $minute ${S.current.minutes}',
              buttonLabel: S.current.lessonHistory,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.lessonHistory);
              },
            ),

            // swipe hint
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getScreenWidth(context) * 0.03,
                vertical: Dimens.getScreenHeight(context) * 0.009,
              ),
              child: Row(
                children: [
                  RowIconTextInformation(
                    context: context,
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: context.theme.colorScheme.onInverseSurface,
                      size: Dimens.getProportionalScreenWidth(context, 20),
                    ),
                    text: Text(
                      S.current.swipeToCancelClass,
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                        fontSize: Dimens.getProportionalScreenWidth(context, 14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const EmptyProportionalSpace(height: 10),
            // upcoming classes list
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: tempList.length,
                itemBuilder: (context, index) {
                  final time = DateTime.now().add(
                    Duration(
                      days: Random().nextInt(5),
                      hours: Random().nextInt(5),
                      minutes: Random().nextInt(5),
                    ),
                  );
                  final endTime = time.add(const Duration(hours: 2));

                  // upcoming class card
                  return Dismissible(
                    key: ValueKey(tempList[index]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      // remove class from list
                      setState(() {
                        tempList.removeAt(index);
                      });
                    },
                    confirmDismiss: (_) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(S.current.confirmCancelClass),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: Text(
                                  S.current.yes,
                                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                                    color: context.theme.colorScheme.onSurfaceVariant,
                                    fontSize: Dimens.getProportionalScreenWidth(context, 16),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text(
                                  S.current.no,
                                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                                    color: context.theme.colorScheme.onErrorContainer,
                                    fontSize: Dimens.getProportionalScreenWidth(context, 16),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: UpcomingClassCard(
                      onButtonTap: () {},
                      tutorName: tempList[index],
                      buttonLabel: S.current.enterRoom,
                      lessonDateTime: time,
                      lessonEndTime: endTime,
                      lessonDateFormat: AppDateFormats.eeeMMMdyyyy,
                      lessonDurationFormat: AppDateFormats.tHHmm,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      margin: EdgeInsets.only(
                        bottom: Dimens.getProportionalScreenHeight(context, 15),
                        left: Dimens.getScreenWidth(context) * 0.03,
                        right: Dimens.getScreenWidth(context) * 0.03,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
