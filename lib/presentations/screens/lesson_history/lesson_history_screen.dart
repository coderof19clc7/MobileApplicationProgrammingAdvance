import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/lesson_history/bloc/histories_cubit.dart';
import 'package:one_one_learn/presentations/screens/lesson_history/lesson_history_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class LessonHistoryScreen extends BaseScreen<HistoriesCubit, HistoriesState> {
  const LessonHistoryScreen({super.key});

  @override
  HistoriesCubit provideBloc(BuildContext context) {
    return HistoriesCubit();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const LessonHistoryPage();
  }
}
