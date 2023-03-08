import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/lesson_history_screen/widgets/lesson_history_card.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';

class LessonHistoryScreen extends StatelessWidget {
  const LessonHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tempList = [
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

    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Container(
        padding: EdgeInsets.only(
          bottom: Dimens.getBottomSafeAreaHeight(context) + 10,
        ),
        width: Dimens.getScreenWidth(context),
        height: Dimens.getScreenHeight(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // lesson list
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

                  // lesson history card
                  return LessonHistoryCard(
                    tutorName: tempList[index],
                    lessonDateTime: time,
                    lessonEndTime: endTime,
                    lessonDateFormat: 'EEE, MMM d, yyyy',
                    lessonDurationFormat: 'HH:mm',
                    isMarked: index.isEven,

                    crossAxisAlignment: CrossAxisAlignment.center,
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
