import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/list_tutors.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/search_field.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/upcoming_class_banner.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
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
        body: SizedBox(
          width: Dimens.getScreenWidth(context),
          height: Dimens.getScreenHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // nearest upcoming class countdown
              UpcomingClassBanner(
                width: Dimens.getScreenWidth(context),
                topLabel: S.current.labelUpcomingClass,
                startTime: startTime,
                endTime: endTime,
                upcomingDateFormat: AppDateFormats.eeeMMMdyyyy,
                upcomingTimeFormat: AppDateFormats.tHHmm,
                buttonLabel: S.current.enterRoom,
                onTap: () {
                  Navigator.of(context).pushNamed(RouteNames.videoCall);
                },
              ),
              const EmptyProportionalSpace(height: 10),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.getScreenWidth(context) * 0.03,
                  ),
                  child: Column(
                    children: const [
                      // search field
                      SearchField(),
                      EmptyProportionalSpace(height: 30),
                      // tutor list
                      Expanded(child: ListTutors()),
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
