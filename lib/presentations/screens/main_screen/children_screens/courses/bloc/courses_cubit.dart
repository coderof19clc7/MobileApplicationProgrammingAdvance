import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

part 'courses_state.dart';

class CoursesCubit extends WidgetCubit<CoursesState> {
  CoursesCubit() : super(widgetState: const CoursesState());

  @override
  void onWidgetCreated() {}
}
