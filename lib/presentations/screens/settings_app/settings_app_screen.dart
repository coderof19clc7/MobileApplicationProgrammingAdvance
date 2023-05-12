import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/empty_bloc/empty_cubit.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class SettingsAppScreen extends BaseScreen<EmptyCubit, EmptyState> {
  const SettingsAppScreen({super.key, required this.args});

  final SettingsAppArgs args;

  @override
  EmptyCubit provideBloc(BuildContext context) {
    return EmptyCubit();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return SettingsAppPage(settingsType: args.settingsType);
  }
}

class SettingsAppArgs {
  const SettingsAppArgs({required this.settingsType});

  final SettingsAppType settingsType;
}
