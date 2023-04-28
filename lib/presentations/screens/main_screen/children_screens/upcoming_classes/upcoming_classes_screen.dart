import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/empty_bloc/empty_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/upcoming_classes_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class UpcomingClassesScreen extends BaseScreen<EmptyCubit, EmptyState> {
  const UpcomingClassesScreen({super.key});

  @override
  EmptyCubit provideBloc(BuildContext context) {
    return EmptyCubit();
  }

  @override
  void onListenerIsLoading(BuildContext context, EmptyState state) {}

  @override
  Widget buildWidget(BuildContext context) {
    return const UpcomingClassesPage();
  }
}

