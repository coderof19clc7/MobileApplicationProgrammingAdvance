import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/empty_bloc/empty_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/courses_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class CoursesScreen extends BaseScreen<EmptyCubit, EmptyState> {
  const CoursesScreen({super.key});

  @override
  EmptyCubit provideBloc(BuildContext context) {
    return EmptyCubit();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const CoursesPage();
  }
}

