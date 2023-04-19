import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/course_information/bloc/course_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class CourseInformationScreen extends BaseScreen<CourseInformationCubit, CourseInformationState> {
  const CourseInformationScreen({super.key, required this.args});

  final CourseInformationArguments args;

  @override
  Widget buildWidget(BuildContext context) {
    return const CourseInformationPage();
  }

  @override
  CourseInformationCubit provideBloc(BuildContext context) {
    return CourseInformationCubit(courseId: args.courseId, category: args.category)..getCourseInformation();
  }
}

class CourseInformationArguments {
  const CourseInformationArguments({required this.courseId, required this.category});

  final String courseId;
  final String category;
}
