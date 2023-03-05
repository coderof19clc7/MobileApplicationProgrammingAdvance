import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/upcoming_classes_screen/widgets/total_lesson_time_banner.dart';
import 'package:one_one_learn/presentations/screens/upcoming_classes_screen/widgets/upcoming_class_card.dart';

class UpcomingClassesScreen extends StatefulWidget {
  const UpcomingClassesScreen({super.key});

  @override
  State<UpcomingClassesScreen> createState() => _UpcomingClassesScreenState();
}

class _UpcomingClassesScreenState extends State<UpcomingClassesScreen> {
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
    final hour = Random().nextInt(12) + 1;
    final minute = Random().nextInt(45);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: Dimens.getTopSafeAreaHeight(context) + 10,
          bottom: Dimens.getBottomSafeAreaHeight(context) + 10,
        ),
        width: Dimens.getScreenWidth(context),
        height: Dimens.getScreenHeight(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // total lesson time
            TotalLessonTimeBanner(
              width: Dimens.getScreenWidth(context),
              height: Dimens.getScreenHeight(context) * 0.16,
              topLabel: S.current.labelTotalLessonTime,
              totalTime:
                  '$hour ${S.current.hours} $minute ${S.current.minutes}',
              buttonLabel: S.current.lessonHistory,
              onTap: () {},
            ),

            // swipe hint
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getScreenWidth(context) * 0.03,
                vertical: Dimens.getScreenHeight(context) * 0.009,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.neutralBlue500,
                    size: Dimens.getProportionalScreenHeight(context, 16),
                  ),
                  SizedBox(
                    width: Dimens.getProportionalScreenWidth(context, 5),
                  ),
                  Text(
                    S.current.swipeToCancelClass,
                    style: TextStyle(
                      color: AppColors.neutralBlue500,
                      fontSize: Dimens.getProportionalScreenHeight(context, 12),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: Dimens.getProportionalScreenHeight(context, 10),
            ),

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
                  return UpcomingClassCard(
                    valueKey: ValueKey(tempList[index]),
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
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(S.current.yes),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(S.current.no),
                              )
                            ],
                          );
                        },
                      );
                    },
                    onTap: () {},
                    tutorName: tempList[index],
                    buttonLabel: S.current.enterRoom,
                    lessonDateTime: time,
                    lessonEndTime: endTime,
                    lessonDateFormat: 'EEE, MMM d, yyyy',
                    lessonDurationFormat: 'HH:mm',
                    margin: EdgeInsets.only(
                      bottom: Dimens.getProportionalScreenHeight(context, 15),
                      left: Dimens.getScreenWidth(context) * 0.03,
                      right: Dimens.getScreenWidth(context) * 0.03,
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
}
