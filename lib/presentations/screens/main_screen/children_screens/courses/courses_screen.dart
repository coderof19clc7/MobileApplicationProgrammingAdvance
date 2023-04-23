import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/bloc/courses_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/courses_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class CoursesScreen extends BaseScreen<CoursesCubit, CoursesState> {
  const CoursesScreen({super.key});

  @override
  CoursesCubit provideBloc(BuildContext context) {
    return CoursesCubit();
  }

  @override
  void onListenerIsLoading(BuildContext context, CoursesState state) {}

  @override
  Widget buildWidget(BuildContext context) {
    return const CoursesPage();
  }
}

