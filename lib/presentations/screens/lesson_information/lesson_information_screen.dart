import 'package:flutter/material.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/bloc/lesson_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/lesson_information_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class LessonInformationScreen extends BaseScreen<LessonInformationCubit, LessonInformationState> {
  const LessonInformationScreen({super.key, required this.args});

  final LessonInformationArgs args;

  @override
  LessonInformationCubit provideBloc(BuildContext context) {
    return LessonInformationCubit(groupedBookingInfo: args.groupedBookingInfo);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const LessonInformationPage();
  }
}

class LessonInformationArgs {
  const LessonInformationArgs({
    required this.groupedBookingInfo,
  });

  final GroupedBookingInfo groupedBookingInfo;
}
