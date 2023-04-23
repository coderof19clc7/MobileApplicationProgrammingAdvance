import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/course_information/bloc/course_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class CourseInformationScreen extends BaseScreen<CourseInformationCubit, CourseInformationState> {
  const CourseInformationScreen({super.key, required this.args});

  final CourseInformationArguments args;

  @override
  CourseInformationCubit provideBloc(BuildContext context) {
    return CourseInformationCubit(courseId: args.courseId, categories: args.categories)..getCourseInformation();
  }

  @override
  void onListenerIsLoading(BuildContext context, CourseInformationState state) {}

  @override
  Widget buildWidget(BuildContext context) {
    return const CourseInformationPage();
  }
}

class CourseInformationArguments {
  const CourseInformationArguments({required this.courseId, required this.categories});

  final String courseId;
  final List<String> categories;
}
