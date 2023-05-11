import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/empty_bloc/empty_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/settings/settings_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class SettingsScreen extends BaseScreen<EmptyCubit, EmptyState> {
  const SettingsScreen({super.key});

  @override
  EmptyCubit provideBloc(BuildContext context) {
    return EmptyCubit();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const SettingsPage();
  }
}

